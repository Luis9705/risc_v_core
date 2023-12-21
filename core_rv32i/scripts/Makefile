# @Author : mylui
# @Date   : 2023-12-20

work = work

top_tb_name = core_rv32i_tb

ifeq ($(OS),Windows_NT)

ifneq ("$(wildcard ../rtl)","")
INCRTL = +incdir+../rtl
else
INCRTL =
endif

ifneq ("$(wildcard ../rtl/*.sv)","")
RTL = ../rtl/core_rv32i.sv
else
RTL =
endif

ifneq ("$(wildcard ../dv/tb)","")
INCTB = +incdir+../dv/tb
else
INCTB =
endif

ifneq ("$(wildcard ../dv/tb/*.sv)","")
TB = ../dv/tb/core_rv32i_tb.sv
else
TB =
endif

ifneq ("$(wildcard ../dv/env/agent)","")
INCINTF = +incdir+../dv/env/agent
else
INCINTF =
endif

ifneq ("$(wildcard ../dv/env/agent/*intf.sv)","")
INTF = ../dv/env/agent/core_rv32i_intf.sv
else
INTF =
endif

ifneq ("$(wildcard ../dv/env/agent)","")
INCAGT = +incdir+../dv/env/agent
else
INCAGT =
endif

ifneq ("$(wildcard ../dv/env/agent/*pkg.sv)","")
AGT = ../dv/env/agent/core_rv32i_agent_pkg.sv
else
AGT =
endif

ifneq ("$(wildcard ../dv/env/agent/sequence_lib)","")
INCSEQ_LIB = +incdir+../dv/env/agent/sequence_lib
else
INCSEQ_LIB =
endif

ifneq ("$(wildcard ../dv/env/agent/sequence_lib/*pkg.sv)","")
SEQ_LIB = ../dv/env/agent/sequence_lib/core_rv32i_seq_pkg.sv
else
SEQ_LIB =
endif

ifneq ("$(wildcard ../dv/env)","")
INCENV = +incdir+../dv/env
else
INCENV =
endif

ifneq ("$(wildcard ../dv/env/*pkg.sv)","")
ENV = ../dv/env/core_rv32i_env_pkg.sv
else
ENV =
endif

ifneq ("$(wildcard ../dv/env/agent/regs)","")
INCREG = +incdir+../dv/env/agent/regs
else
INCREG =
endif

ifneq ("$(wildcard ../dv/env/agent/regs/*pkg.sv)","")
REG = ../dv/env/agent/regs/core_rv32i_regs_pkg.sv
else
REG =
endif

ifneq ("$(wildcard ../dv/tests)","")
INCTESTS = +incdir+../dv/tests
else
INCTESTS =
endif

ifneq ("$(wildcard ../dv/tests/*pkg.sv)","")
TESTS = ../dv/tests/core_rv32i_test_pkg.sv
else
TESTS =
endif

else

ifneq ("$(wildcard ../rtl)","")
INCRTL = +incdir+../rtl
else
INCRTL =
endif

ifneq ("$(wildcard ../rtl/*.sv)","")
RTL = ../rtl/*.sv
else
RTL =
endif

ifneq ("$(wildcard ../dv/tb)","")
INCTB = +incdir+../dv/tb
else
INCTB =
endif

ifneq ("$(wildcard ../dv/tb/*.sv)","")
TB = ../dv/tb/*.sv
else
TB =
endif

ifneq ("$(wildcard ../dv/env/agent)","")
INCINTF = +incdir+../dv/env/agent
else
INCINTF =
endif

ifneq ("$(wildcard ../dv/env/agent/*intf.sv)","")
INTF = ../dv/env/agent/*intf.sv
else
INTF =
endif

ifneq ("$(wildcard ../dv/env/agent)","")
INCAGT = +incdir+../dv/env/agent
else
INCAGT =
endif

ifneq ("$(wildcard ../dv/env/agent/*pkg.sv)","")
AGT = ../dv/env/agent/*pkg.sv
else
AGT =
endif

ifneq ("$(wildcard ../dv/env/agent/sequence_lib)","")
INCSEQ_LIB = +incdir+../dv/env/agent/sequence_lib
else
INCSEQ_LIB =
endif

ifneq ("$(wildcard ../dv/env/agent/sequence_lib/*pkg.sv)","")
SEQ_LIB = ../dv/env/agent/sequence_lib/*pkg.sv
else
SEQ_LIB =
endif

ifneq ("$(wildcard ../dv/env)","")
INCENV = +incdir+../dv/env
else
INCENV =
endif

ifneq ("$(wildcard ../dv/env/*pkg.sv)","")
ENV = ../dv/env/*pkg.sv
else
ENV =
endif

ifneq ("$(wildcard ../dv/env/agent/regs)","")
INCREG = +incdir+../dv/env/agent/regs
else
INCREG =
endif

ifneq ("$(wildcard ../dv/env/agent/regs/*pkg.sv)","")
REG = ../dv/env/agent/regs/*pkg.sv
else
REG =
endif

ifneq ("$(wildcard ../dv/tests)","")
INCTESTS = +incdir+../dv/tests
else
INCTESTS =
endif

ifneq ("$(wildcard ../dv/tests/*pkg.sv)","")
TESTS = ../dv/tests/*pkg.sv
else
TESTS =
endif

endif

ifeq ($(OS),Windows_NT)
DELFILES = clean_dos
else
DELFILES = clean_linux
endif

cmp:
	xvlog -work $(work) -i ../dv -sv $(RTL) $(SEQ_LIB) $(REG) $(INTF) $(AGT) $(ENV) $(TESTS) $(TB) -L uvm
	xelab work.$(top_tb_name) -s $(top_tb_name)_sim -L uvm -timescale 1ns/1ps -debug all

run_sim_wave:
	xsim -wdb dv.wdb -log session.log -t logw.tcl $(top_tb_name)_sim -testplusarg "UVM_TESTNAME=core_rv32i_sanity_test"
	xsim dv.wdb -gui

view_wave:
	xsim dv.wdb -gui

run_sim:
	xsim -runall -log session.log $(top_tb_name)_sim -testplusarg "UVM_TESTNAME=core_rv32i_sanity_test"

clean_linux:
	rm -rf modelsim.* transcript* vlog.* work vsim.wlf *.log *hbs *Xil xsim.dir *.jou *.pb
	clear

clean_dos:
	if exist modelsim.* del modelsim.* /F /S /Q /A
	if exist transcript* del transcript* /F /S /Q /A
	if exist vlog.* del vlog.* /F /S /Q /A
	if exist vsim.wlf del vsim.wlf /F /S /Q /A
	if exist *.log del *.log /F /S /Q /A
	if exist work rd work /q /s
	if exist covhtmlreport rd covhtmlreport /q /s
	if exist *hbs del *hbs /q /s
	if exist *Xil del *Xil /q /s
	if exist xsim.dir del xsim.dir /q /s
	if exist *.jou del *.jou /F /S /Q /A
	if exist *.pb del *.pb /F /S /Q /A

clean_log:
	if exist *.log del *.log /f /s /q /a

clean:
	make $(DELFILES)

run_all:
	make clean
	make cmp
	make run_sim

run_all_gui:
	make clean
	make cmp
	make run_sim_wave
