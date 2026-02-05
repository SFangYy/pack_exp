# Rob 验证环境 - Python-UVM 混合集成

## 概述

本目录包含 Rob 项目的 UVM 验证环境,支持两种运行模式:
1. **传统 UVM 仿真** - 纯 SystemVerilog UVM 仿真
2. **Python-UVM 混合仿真** - Python 驱动,SystemVerilog UVM 响应

## 目录结构

```
sim/
├── Makefile              # 编译脚本
├── README.md             # 本文档
└── base_fun/             # 所有输出文件目录
    ├── CSR_in_agent_xaction/  # Python 包和共享库
    │   ├── __init__.py        # DUT Python 接口
    │   ├── xagent.py          # Agent 类定义
    │   ├── utils_pkg.sv       # 序列化/反序列化宏
    │   ├── tlm_pbsb.py        # SWIG 生成的 Python 接口
    │   ├── _tlm_pbsb.so       # VCS 生成的共享库 (95MB)
    │   ├── _tlm_pbsb.so.daidir/ # 依赖库目录
    │   └── xspcomm/           # xspcomm Python 库
    ├── build/               # 编译临时文件
    ├── example.py           # Python 示例脚本
    ├── xspcomm/             # xspcomm 库副本
    ├── exec/                # 传统 simv 可执行文件
    ├── log/                 # 日志文件
    └── wave/                # 波形文件
```

## 环境要求

### 必需的环境变量

```bash
export UVMC_HOME=/path/to/uvmc
export VCS_HOME=/path/to/vcs
export UVM_HOME=/path/to/uvm
export VERDI_HOME=/path/to/verdi
export XSP_COMM_INCLUDE=/path/to/xcomm/include
export XSP_PYTHON=/path/to/xcomm/python
```

### 必需的工具

- **Python 3.11+**: 用于运行 Python 测试脚本
- **VCS (W-2024.09-SP1)**: Synopsys VCS 仿真器
- **SWIG**: 用于生成 Python-C++ 接口
- **GCC/G++**: C++ 编译器
- **SystemC**: 系统级建模库 (VCS 自带)

## Makefile 目标

### 完整编译

```bash
make all
```

执行完整编译流程,包括:
1. 清理旧的构建产物
2. 编译验证环境
3. 复制 xspcomm 库
4. 复制 Python 包文件
5. 复制 Python 示例脚本

### 编译验证环境

```bash
make compile
```

仅编译验证环境,生成:
- `base_fun/CSR_in_agent_xaction/_tlm_pbsb.so` - VCS 共享库
- `base_fun/CSR_in_agent_xaction/tlm_pbsb.py` - SWIG Python 接口
- `base_fun/exec/simv` - 传统 UVM 可执行文件

### 清理构建产物

```bash
make clean
```

删除所有构建产物,包括:
- `base_fun/` 目录及其所有内容
- `work/`, `csrc/` 临时目录
- `simv*`, `AN.DB`, `*.log`, `*.vpd` 文件

### 运行 Python-UVM 混合仿真

```bash
make run_python
```

运行 Python 驱动的 UVM 仿真:
1. 复制所需的 Python 文件
2. 预加载 `_tlm_pbsb.so` 共享库
3. 执行 `base_fun/example.py`

### 运行传统 UVM 仿真

```bash
make run
```

运行纯 SystemVerilog UVM 仿真:
- 使用 `base_fun/exec/simv` 可执行文件
- 默认测试: `tc_sanity`

### 复制依赖库

```bash
make copy_xspcomm       # 复制 xspcomm 库
make copy_python_pkg    # 复制 Python 包文件
make copy_example       # 复制 Python 示例脚本
```

### 查看帮助

```bash
make help
```

显示所有可用的 Makefile 目标。

## Python-UVM 混合集成详解

### 集成架构

Python-UVM 混合仿真采用以下架构:

```
Python 端                            SystemVerilog 端
    |                                        |
    v                                        v
example.py                              Rob_env.sv
    |                                        |
    +-- CSR_in_agent_xaction               +-- CSR_in_agent_xaction_xagent
        |    (DUT 接口)                          |    (UVM Agent)
        |                                        |
        +-- Agent                               +-- CSR_in_agent_python_pkg
            |    (Python Agent)                      |    (Python Agent)
            |                                        |
            +-- tlm_pbsb.py                         +-- UVMC TLM
            |    (SWIG 接口)                           |    (跨语言通信)
            |                                        |
            +-- _tlm_pbsb.so                        +-- UVM 仿真器
            |    (VCS 共享库)                            |
            +----------------------------------------+
                        TLM 通信
                   (Publish/Subscribe)
```

### 编译流程

#### 1. SWIG 接口生成

```bash
swig -D'MODULE_NAME="tlm_pbsb"' -python -c++ -DUSE_VCS \
     -I${XSP_COMM_INCLUDE} \
     -outdir base_fun/CSR_in_agent_xaction \
     -o base_fun/build/tlmps.cpp \
     ${XSP_COMM_INCLUDE}/xspcomm/python_tlm_pbsb.i
```

**功能**: 将 C++ 的 TLM 接口包装成 Python 可调用的模块

**输入**:
- `xspcomm/python_tlm_pbsb.i` - SWIG 接口定义文件

**输出**:
- `base_fun/CSR_in_agent_xaction/tlm_pbsb.py` - Python 接口
- `base_fun/build/tlmps.cpp` - Python-C++ 桥接代码

#### 2. SystemC 编译

```bash
syscan -cpp g++ -cc gcc -full64 -cflags -g -cflags -DVCS \
       -tlm2 -cflags -I${VCS_HOME}/include/systemc232/tlm_utils \
       -cflags -I${UVMC_HOME}/src/connect/sc \
       -cflags -DUSE_VCS -cflags "${PYTHON_INCLUDE}" \
       -cflags -I${XSP_COMM_INCLUDE} \
       ${UVMC_HOME}/src/connect/sc/uvmc.cpp \
       ${XSP_COMM_INCLUDE}/xspcomm/tlm_pbsb.cpp \
       base_fun/build/tlmps.cpp
```

**功能**: 编译 SystemC 代码,生成对象文件

**输入**:
- `uvmc.cpp` - UVMC 的 SystemC 端实现
- `tlm_pbsb.cpp` - TLM PBSB 实现
- `tlmps.cpp` - SWIG 包装代码

**输出**:
- `base_fun/build/sysc/*.o` - SystemC 对象文件

#### 3. SystemVerilog 编译

```bash
vlogan -q -full64 -sverilog \
       +incdir+${UVM_HOME}/src ${UVM_HOME}/src/uvm_pkg.sv \
       +incdir+${UVMC_HOME}/src/connect/sv ${UVMC_HOME}/src/connect/sv/uvmc_pkg.sv \
       -timescale=1ns/1ps \
       +define+UVM_OBJECT_MUST_HAVE_CONSTRUCTOR \
       +define+UVM_REGEX_NO_DPI \
       +define+UVMC_NO_COMMANDS \
       +incdir+../tb \
       -F ../cfg/rtl.f \
       ../tb/override_macros.sv \
       ../tb/tcnt_base_pkg.sv \
       -F ../cfg/tb.f
```

**功能**: 编译 SystemVerilog 代码,生成中间表示

**输入**:
- UVM 库
- UVMC 的 SystemVerilog 端
- Rob RTL 和验证环境

**输出**:
- `base_fun/build/` 中的 SystemVerilog 编译产物

#### 4. VCS 链接

```bash
vcs -sysc=deltasync -lca \
    -full64 -sysc -cpp g++ -cc gcc \
    -timescale=1ns/1ps \
    -P ${VERDI_HOME}/share/PLI/VCS/LINUX64/novas.tab \
    ${VERDI_HOME}/share/PLI/VCS/LINUX64/pli.a \
    -CFLAGS -DVCS ${UVM_HOME}/src/dpi/uvm_dpi.cc \
    -debug_access+all \
    -uvm \
    -o base_fun/CSR_in_agent_xaction/_tlm_pbsb.so \
    -e VcsMain sv_main \
    ${VCS_HOME}/linux64/lib/vcs_tls.o -slave \
    -Mdir=base_fun/build
```

**功能**: 链接所有对象文件,生成共享库

**输入**:
- SystemC 对象文件
- SystemVerilog 编译产物
- DPI 层实现
- Verdi 调试接口

**输出**:
- `base_fun/CSR_in_agent_xaction/_tlm_pbsb.so` - 最终的共享库 (95MB)

### Python 端集成

#### 1. Python 包结构

```python
base_fun/CSR_in_agent_xaction/
├── __init__.py       # DUT 接口和初始化
├── xagent.py         # Agent 和事务类
├── tlm_pbsb.py       # SWIG 生成的 TLM 接口
├── _tlm_pbsb.so      # VCS 共享库
└── xspcomm/          # xspcomm 库
```

#### 2. 自动初始化

`__init__.py` 中的自动初始化逻辑:

```python
# 自动设置 LD_PRELOAD 环境变量
so_path = os.path.join(dut_dir, '_tlm_pbsb.so')
env['LD_PRELOAD'] = so_path

# 自动初始化 VCS 仿真器
from . import tlm_pbsb as u
tlm_vcs_init()  # 调用 VCS 初始化函数
```

#### 3. DUT 接口

```python
from CSR_in_agent_xaction import DUTCSR_in_agent_xaction

# 初始化 DUT
dut = DUTCSR_in_agent_xaction()
dut.InitClock()

# 设置引脚值
dut.io_csr_intrBitSet.value = 1
dut.io_csr_wfiEvent.value = 0

# 推进仿真周期
dut.Step(1)
```

#### 4. TLM 通信

Python 端通过 TLM Publish/Subscribe 模式与 SystemVerilog 端通信:

```python
# Driver 发送事务
self._xports['CSR_in_agent_xaction'].Publish(trans)

# Monitor 接收事务
def _monitor_callback(trans_type, trans_obj):
    # 更新引脚值
    self._xpins['io_csr_intrBitSet'].xdata.value = trans_obj.io_csr_intrBitSet.value
```

### SystemVerilog 端集成

#### 1. Python Agent 定义

`CSR_in_agent_python_pkg.sv` 中定义:

```systemverilog
class CSR_in_agent_xaction_xagent extends uvm_agent;
    CSR_in_agent_xaction_xmonitor CSR_in_agent_xaction_xmon;
    CSR_in_agent_xaction_xdriver CSR_in_agent_xaction_xdrv;
    
    // TLM 连接
    uvmc_tlm #()::connect(CSR_in_agent_xaction_xmon.out, "CSR_in_agent_xaction.sub");
    uvmc_tlm #()::connect(CSR_in_agent_xaction_xdrv.in, "CSR_in_agent_xaction.pub");
endclass
```

#### 2. 事务序列化

Monitor 端序列化:

```systemverilog
`PICKER_PACK_BYTE(tr.io_csr_intrBitSet, 0);
`PICKER_PACK_BYTE(tr.io_csr_wfiEvent, 1);
// ...
m_transport_msg.set_data_length(58);
out.b_transport(m_transport_msg, m_delay);
```

Driver 端反序列化:

```systemverilog
m_transport_msg.get_data(m_transport_data);
m_tr.io_csr_intrBitSet = m_transport_data[0];
m_tr.io_csr_wfiEvent = m_transport_data[1];
// ...
```

#### 3. 环境集成

`Rob_env.sv` 中集成:

```systemverilog
class Rob_env extends tcnt_env_base;
    CSR_in_agent_xaction_xagent u_CSR_in_python_agent;
    CSR_in_agent_xaction_xagent_config u_CSR_in_python_agent_cfg;
    
    function void build_phase(uvm_phase phase);
        // 配置 channel 名称
        u_CSR_in_python_agent_cfg.channel_name = "CSR_in_agent_xaction";
        
        // 创建 agent
        uvm_config_db#(CSR_in_agent_xaction_xagent_config)::set(
            this, "u_CSR_in_python_agent",
            "CSR_in_agent_xaction_xagent_config",
            u_CSR_in_python_agent_cfg);
        this.u_CSR_in_python_agent = CSR_in_agent_xaction_xagent::type_id::create(
            "u_CSR_in_python_agent", this);
    endfunction
endclass
```

## 运行示例

### Python-UVM 混合仿真

```bash
cd /path/to/Rob/sim
make all                    # 完整编译
make run_python             # 运行 Python 示例
```

**输出示例**:
```
======================================================================
                  CSR_in_agent_xaction Usage Example                  
======================================================================

Initializing DUT...
[Agent.InitClock] Clock tracking initialized (domain: default)
✓ DUT initialized successfully

Registering monitor callback...
✓ Callback registered

  [Driver ] Send to UVM     : DUTCSR_in_agent_xaction(...)
  [Monitor] Receive from UVM: DUTCSR_in_agent_xaction(...)
```

### 传统 UVM 仿真

```bash
cd /path/to/Rob/sim
make compile                # 编译
make run                    # 运行传统仿真
```

## 关键文件说明

### Python 端

| 文件 | 说明 |
|------|------|
| `CSR_in_agent_xaction/__init__.py` | DUT 接口类,自动初始化 VCS |
| `CSR_in_agent_xaction/xagent.py` | Agent 和事务类定义 |
| `CSR_in_agent_xaction/tlm_pbsb.py` | SWIG 生成的 TLM 接口 |
| `CSR_in_agent_xaction/_tlm_pbsb.so` | VCS 生成的共享库 |
| `CSR_in_agent_xaction/xspcomm/` | xspcomm Python 库 |
| `example.py` | Python 示例脚本 |

### SystemVerilog 端

| 文件 | 说明 |
|------|------|
| `agent/CSR_in_agent/src/CSR_in_agent_python_pkg.sv` | Python Agent 定义 |
| `env/src/Rob_env.sv` | 验证环境,集成 Python Agent |
| `tb/sv_main.sv` | 仿真器入口点 |

## 常见问题

### 1. LD_PRELOAD 错误

**问题**: `ERROR: ld.so: object '...' cannot be preloaded`

**解决**: 确保 `_tlm_pbsb.so` 路径正确,使用绝对路径

### 2. 导入错误

**问题**: `ImportError: cannot import name 'tlm_pbsb'`

**解决**: 确保 `tlm_pbsb.py` 和 `_tlm_pbsb.so` 在同一目录

### 3. SystemC 模型未找到

**问题**: `Note-[SC-VCS-NO-SYSC] No SystemC models found`

**解决**: 确保 VCS_ELAB 命令包含 `-Mdir` 参数

### 4. 编译失败

**问题**: `common elaboration failed`

**解决**: 检查环境变量是否正确设置,查看日志文件

## 参考资料

- **UVM**: Universal Verification Methodology
- **UVMC**: UVM Connect (跨语言通信)
- **VCS**: Synopsys VCS 仿真器
- **SystemC**: 系统级建模标准
- **SWIG**: Simplified Wrapper and Interface Generator
- **TLM**: Transaction Level Modeling

## 版本信息

- **Python**: 3.11+
- **VCS**: W-2024.09-SP1
- **UVM**: 1.1d
- **UVMC**: 最新版本
- **SWIG**: 4.3.1