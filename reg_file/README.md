## reg_file Architecture, Design and Verification Details

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
reg_file
.
├── docs
├── README.md
├── rtl
│   └── reg_file.sv
├── scripts
│   ├── logw.tcl
│   └── Makefile
├── dv
│   ├── env
│   │   ├── agent
│   │   │   ├── reg_file_agent_cfg.sv
│   │   │   ├── reg_file_agent_pkg.sv
│   │   │   ├── reg_file_agent.sv
│   │   │   ├── reg_file_driver.sv
│   │   │   ├── reg_file_intf.sv
│   │   │   ├── reg_file_monitor.sv
│   │   │   ├── reg_file_sequencer.sv
│   │   │   ├── regs
│   │   │   │   └── reg_file_regs_pkg.sv
│   │   │   └── sequence_lib
│   │   │       ├── reg_file_base_seq.sv
│   │   │       ├── reg_file_sanity_seq.sv
│   │   │       ├── reg_file_seq_item.sv
│   │   │       └── reg_file_seq_pkg.sv
│   │   ├── reg_file_cov.sv
│   │   ├── reg_file_env_pkg.sv
│   │   ├── reg_file_env.sv
│   │   └── reg_file_sb.sv
│   ├── tb
│   │   └── reg_file_tb.sv
│   └── tests
│       ├── reg_file_base_test.sv
│       ├── reg_file_sanity_test.sv
│       └── reg_file_test_pkg.sv
└── synth
```
**Note** : .gitignore is added to project directory for easy git integration.
