## core_rv32i Architecture, Design and Verification Details

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
core_rv32i
.
├── docs
├── README.md
├── rtl
│   └── core_rv32i.sv
├── scripts
│   ├── logw.tcl
│   └── Makefile
├── dv
│   ├── env
│   │   ├── agent
│   │   │   ├── core_rv32i_agent_cfg.sv
│   │   │   ├── core_rv32i_agent_pkg.sv
│   │   │   ├── core_rv32i_agent.sv
│   │   │   ├── core_rv32i_driver.sv
│   │   │   ├── core_rv32i_intf.sv
│   │   │   ├── core_rv32i_monitor.sv
│   │   │   ├── core_rv32i_sequencer.sv
│   │   │   ├── regs
│   │   │   │   └── core_rv32i_regs_pkg.sv
│   │   │   └── sequence_lib
│   │   │       ├── core_rv32i_base_seq.sv
│   │   │       ├── core_rv32i_sanity_seq.sv
│   │   │       ├── core_rv32i_seq_item.sv
│   │   │       └── core_rv32i_seq_pkg.sv
│   │   ├── core_rv32i_cov.sv
│   │   ├── core_rv32i_env_pkg.sv
│   │   ├── core_rv32i_env.sv
│   │   └── core_rv32i_sb.sv
│   ├── tb
│   │   └── core_rv32i_tb.sv
│   └── tests
│       ├── core_rv32i_base_test.sv
│       ├── core_rv32i_sanity_test.sv
│       └── core_rv32i_test_pkg.sv
└── synth
```
**Note** : .gitignore is added to project directory for easy git integration.
