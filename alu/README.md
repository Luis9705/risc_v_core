## alu Architecture, Design and Verification Details

In RTL, values in the ALU are unsigned, so we need to be careful with signed 
operations, such as SLT (Set less than signed) and SRA (Shift right 
arithmetic). 
 
In Testbench we are using ints, which are signed, so we need to be 
careful with unsigned operations, such as SLTU (Set less than unsigned). 

All other operations (ADD, SUB, XOR, OR, AND) don't care about the sign.

### Commands to run sanity test
#### Without Wave Dump
```bash
cd scripts
make run_all
```
#### With Waveform Dump
```bash
cd scripts
make run_all_gui
```
### Directory Structure
```
alu
.
├── docs
├── README.md
├── rtl
│   └── alu.sv
├── scripts
│   ├── logw.tcl
│   └── Makefile
├── dv
│   ├── env
│   │   ├── agent
│   │   │   ├── alu_agent_cfg.sv
│   │   │   ├── alu_agent_pkg.sv
│   │   │   ├── alu_agent.sv
│   │   │   ├── alu_driver.sv
│   │   │   ├── alu_intf.sv
│   │   │   ├── alu_monitor.sv
│   │   │   ├── alu_sequencer.sv
│   │   │   ├── regs
│   │   │   │   └── alu_regs_pkg.sv
│   │   │   └── sequence_lib
│   │   │       ├── alu_base_seq.sv
│   │   │       ├── alu_sanity_seq.sv
│   │   │       ├── alu_seq_item.sv
│   │   │       └── alu_seq_pkg.sv
│   │   ├── alu_cov.sv
│   │   ├── alu_env_pkg.sv
│   │   ├── alu_env.sv
│   │   └── alu_sb.sv
│   ├── tb
│   │   └── alu_tb.sv
│   └── tests
│       ├── alu_base_test.sv
│       ├── alu_sanity_test.sv
│       └── alu_test_pkg.sv
└── synth
```
**Note** : .gitignore is added to project directory for easy git integration.
