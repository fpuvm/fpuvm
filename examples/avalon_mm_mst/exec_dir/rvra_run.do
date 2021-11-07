#clear the console
clear

transcript file az_avalon.log
# create project library and make sure it is empty
alib work
adel -all

# compile project's source file (alongside the UVM library)
acom -dbg ../dut_src/avalon_slave.vhdl
alog -uvmver 1.2  -dbg -f flist


# run simulation
asim +access +rw -l uvm1.2 top +UVM_VERBOSITY=UVM_FULL +UVM_TESTNAME=avalon_mm_mst_wr_rd_test

wave -rec sim:/top/* 
run -all
