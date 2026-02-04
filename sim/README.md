# Rob UVM 验证平台使用说明

## 目录结构
```
Rob_ver/ver/ut/Rob/sim/
├── Makefile          # 主Makefile
├── base_fun/         # 默认仿真模式目录
│   ├── log/          # 仿真日志
│   ├── wave/         # 波形文件
│   ├── cov/          # 覆盖率数据
│   └── exec/         # 可执行文件
└── regress.ini       # 回归配置文件
```

## 基本运行命令

在 `sim` 目录下执行：

### 1. 编译 + 运行（最常用）
```bash
make run
```
执行完整流程：编译 DUT + 编译 Testbench + 运行仿真

### 2. 单独编译
```bash
make compile
```

### 3. 单独运行
```bash
make batch_run
```

## 常用参数选项

### 指定 Testcase
```bash
make run tc=tc_sanity        # 运行指定testcase
```

### 指定随机种子
```bash
make run seed=rand           # 使用随机种子
make run seed=123456         # 使用固定种子
```

### 波形控制
```bash
make run wave=on             # 生成波形文件（默认）
make run wave=null           # 不生成波形
```

### 打印级别
```bash
make run pl=UVM_DEBUG        # 详细打印
make run pl=UVM_HIGH
make run pl=UVM_MEDIUM       # 默认
make run pl=UVM_LOW
make run pl=UVM_NONE         # 最少打印
```

### 仿真模式
```bash
make run mode=base_fun       # 基本功能模式（默认）
```

### 覆盖率控制
```bash
make run ccov=on             # 打开代码覆盖率
make run fcov=on             # 打开功能覆盖率
make run ccov=off fcov=off   # 关闭所有覆盖率
```

## 组合参数示例
```bash
# 完整参数示例
make run tc=tc_full seed=rand pl=UVM_HIGH wave=on ccov=on fcov=on
```

## 回归测试

### 运行回归
```bash
make do_regr
```

### 查看回归结果
```bash
make get_regr         # 查看回归结果
make get_total        # 查看总体状态
make get_regr_cov     # 查看回归覆盖率
```

## 波形查看

```bash
make wave             # 使用 Verdi/DVE 查看波形
make wave0            # 另一种波形查看方式
make indago           # 使用 Indago 查看波形
```

## 覆盖率查看

```bash
make cov_gui          # 图形化界面查看覆盖率
make cov_txt          # 文本格式查看覆盖率
make cov_txt_sum      # 查看覆盖率汇总
```

## 清理命令

```bash
make clean            # 清理所有生成文件（log、wave、cov、exec）
```

## 默认配置

| 参数 | 默认值 | 说明 |
|------|--------|------|
| seed | 666666 | 随机种子 |
| tc | tc_sanity | 默认testcase |
| pl | UVM_MEDIUM | 打印级别 |
| mode | base_fun | 仿真模式 |
| wave | on | 波形生成 |
| timing | rtl | 仿真时序模式 |
| ccov | off | 代码覆盖率 |
| fcov | off | 功能覆盖率 |

## 仿真日志位置

日志文件保存在 `./base_fun/log/` 目录下，命名格式：
```
<tc>_<seed>_<timing>_<note>.log
```

示例：
```
tc_sanity_666666_rtl.log
```

## 仿真波形位置

波形文件保存在 `./base_fun/wave/` 目录下，命名格式：
```
<tc>_<seed>_<timing>_<note>.fsdb
```

## 仿真工具

默认使用 VCS (Synopsys Verilog Compiler Simulator)

## 注意事项

1. 首次运行需要执行 `make compile` 或 `make run` 进行编译
2. 修改 RTL 代码后需要重新编译
3. 修改 Testbench 代码后需要重新编译
4. 确保仿真工具（VCS）已正确安装并配置环境变量
5. 回归测试需要在 `regress.ini` 中配置 test case 列表

## 回归配置

回归配置文件位于 `../regress/regress.ini`，可以配置：
- Test case 列表
- 运行次数
- 种子设置
- 覆盖率选项
- 并行运行数量