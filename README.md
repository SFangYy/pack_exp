# UVM-Python 混合验证框架集成说明书

本文档旨在介绍集成到 `Rob` 验证环境中的 UVM-Python 混合验证框架。文档涵盖了框架架构、Python 端的功能细节，以及将 `uvmpy_rob` 生成组件集成到现有环境中所做的具体修改与优化。

## 1. 概述

混合框架实现了在传统 UVM 环境中进行 **Python 驱动的验证**。它允许验证工程师利用 Python 丰富的生态系统和易用性来编写测试场景、Driver 和 Monitor，同时保留 SystemVerilog/UVM 的周期级精确仿真能力。

### 架构
- **SystemVerilog 端**:
  - `rob_python_agent`: 一个统一的 UVM Agent，封装了 UVMC (UVM Connect) TLM 端口。
  - 自定义 Drivers/Monitors: SV 组件，负责将 TLM 事务转换为 DUT 的引脚级信号，反之亦然。
- **Python 端 (`PyRob`)**:
  - `DUTrob`: DUT 接口的 Python 抽象层。
  - `Agent`: 管理 TLM 通信以及与仿真器的同步。
  - `example.py`: 用户级测试脚本，用于驱动验证逻辑。
- **桥接层**:
  - **UVMC**: 处理跨语言的 TLM 通信。
  - **DPI/PLI**: 管理进程同步和数据传输。

---

## 2. 目录结构

```text
agent/rob_python_agent/
├── rob_python_agent_pkg.sv       # 统一的 SV Package 包装文件
├── rob_python_agent.f            # 用于编译的文件列表 (已修正为相对路径)
└── src/
    ├── rob_xagent_generated.sv   # 搬运自 uvmpy_rob 的自动生成核心逻辑
    ├── utils_pkg.sv              # 序列化/反序列化宏定义工具包
    ├── Mem_in_agent_python_driver.sv      # 自定义驱动逻辑
    ├── Mem_in_agent_python_monitor.sv     # 自定义采样逻辑
    ├── rename_in_agent_python_driver.sv
    ├── rename_in_agent_python_monitor.sv
    ├── WriteBack_in_agent_python_driver.sv
    └── WriteBack_in_agent_python_monitor.sv

sim/base_fun/PyRob/
├── __init__.py                   # DUTrob 类定义与环境变量 (LD_PRELOAD) 处理
├── xagent.py                     # 基础事务类与各事务 (Rename/Mem/WB) 定义
└── xspcomm/                      # 底层通信动态库
```

---

## 3. 集成修改与优化记录

为了确保 `uvmpy_rob` 的生成组件能在 `Rob` 环境中稳定运行，我们执行了以下关键修改：

### A. SystemVerilog 端的工程化
1. **Package 封装化**: 
   - 创建了 `rob_python_agent_pkg.sv`，将原本散乱的生成类和自定义类统一封装。
   - 解决了 `import utils_pkg::*;` 在多个 Agent 间重复定义的冲突问题。
2. **路径逻辑修正**: 
   - 修正了 `.f` 文件中的 `+incdir+` 路径，全部改为相对路径，确保环境在任何目录下都能正确编译。
   - 将 `utils_pkg.sv` 中的序列化宏移出 Package 作用域，解决了 VCS 编译时报“Undefined macro”的问题。  
   - 调整了 `rob_python_agent.f` 编译顺序，确保宏定义先于引用生效。
3. **环境深度集成**: 
   - 在 `Rob_env.sv` 中完成了 `Mem`, `rename`, `WriteBack` 三个 Agent 的例化。
   - 使用 **Factory Override** 机制，将生成的基类替换为我们手写的 `python_driver/monitor`，实现了 TLM 到硬件引脚的映射。
   - 清理了旧版 `CSR_in_agent` 的冗余配置和文件。

---

## 4. Python 端驱动 UVM 详细指南

在 Python 端驱动 UVM 环境的核心是 **`DUTrob`** 类，它作为硬件接口在 Python 中的影子镜像，通过以下四个标准化步骤实现闭环验证。

### 第一步：初始化连接 (Initialization)
通过实例化 `DUTrob` 自动建立 UVMC 跨语言通道。
```python
from PyRob import DUTrob

# 1. 实例化镜像对象：这会加载底层 DPI 库并与正在运行的 VCS 进程握手
dut = DUTrob()

# 2. 初始化时钟：启用周期统计功能，方便后续在日志中记录仿真时间
dut.InitClock()
```

### 第二步：注册回调函数 (Register Callback)
**这是 Python 获取硬件回传数据的唯一方式**。
每当 SystemVerilog 端的 Monitor 采样到引脚变化并将其发回 Python 时，你注册的回调函数就会被触发。
```python
def my_monitor_handler(dut):
    # 此时 dut 内部的属性已经是 SV 采样回来的最新值
    if dut.io_enq_req_0_valid.value:
        pc = dut.io_enq_req_0_bits_pc.value
        print(f"[Callback] 捕获硬件行为：PC=0x{pc:x}")

# 必须在 dut.Step 运行前注册
dut.SetUpdateCallback(my_monitor_handler)
```

### 第三步：设置信号值 (Set Values / Write)
你可以像操作普通对象属性一样修改引脚值。
- **Dirty-Check 机制**: 只有当你修改了 `.value`，引脚才会被标记为“脏”。此时数据仍留在 Python 本地缓存中，**并未发送**给仿真器。
- **并发驱动**: 你可以在一次 Step 前同时设置 Rename, WriteBack 和 Mem 的引脚，它们将在同一个仿真时刻生效。
```python
dut.io_enq_req_0_valid.value = 1
dut.io_enq_req_0_bits_pc.value = 0xABCD1234
dut.io_writeback_24_valid.value = 1
```

### 第四步：驱动时钟与同步 (Drive Clock / Sync)
调用 **`dut.Step(cycles)`** 是 Python 与仿真引擎握手的**唯一**时刻。
该函数执行时会按顺序完成以下动作：
1. **打包发送**: 检查本地所有被标记为“脏”的引脚，打包成事务通过 UVMC 发送给 SV 端的 Driver。
2. **运行仿真**: 通知 VCS 向前运行指定的 cycles（通常为 1 周期）。
3. **自动采样**: SV 端的 Monitor 自动工作，采样最新的硬件状态。
4. **回传与更新**: 自动捕获回传的数据包，更新 Python 对象内部的引脚值，并触发 `my_monitor_handler`。
```python
# 推进 1 个周期，实现引脚的驱动、采样和 Python 镜像的更新
dut.Step(1)
```

---

## 5. 运行与调试

### 运行方式
- **编译**: `make compile` (确保 SV 语法无误，SO 文件生成)
- **运行**: `make run` (启动仿真并运行 `sim/base_fun/example.py`)

### 日志查看指南
日志中包含三类关键信息，用于判断通信是否正确：
1. `[Python Send]`: Python 脚本在调用 `Step` 前准备驱动的数据。
2. `[Python Recv]`: `monitor_callback` 捕获到的、从硬件回传的数据。
3. `[RENAME_IN_PYTHON_DRV]`: SystemVerilog Driver 接收到 Python 事务并驱动到引脚的动作记录。

---

## 6. 注意事项
- **端口名称一致性**: Python 端注册的事务名称必须与 SV 端 `channel_name` 字符串完全匹配。
- **位宽匹配**: Python 端的 `FieldMeta` 定义必须与 SV 端的 `PICKER_PACK` 偏移量严格对应。