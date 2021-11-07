`ifndef AVALON_MM_MST_SBRD
`define AVALON_MM_MST_SBRD

class avalon_mm_mst_sbrd extends uvm_scoreboard;

  uvm_tlm_analysis_fifo #(avalon_mm_xactn) afifo;
  avalon_mm_xactn u_sb_xn;

  `uvm_component_utils_begin (avalon_mm_mst_sbrd)
  `uvm_component_utils_end

  `FP_UVM_COMP_NEW
  
  extern virtual function void build_phase (uvm_phase phase);
  extern virtual task run_phase (uvm_phase phase);
endclass : avalon_mm_mst_sbrd 

function void avalon_mm_mst_sbrd::build_phase (uvm_phase phase);
  super.build_phase (phase);
  afifo = new ("afifo", this);
endfunction : build_phase 

task avalon_mm_mst_sbrd::run_phase (uvm_phase phase);
  super.run_phase (phase);
  forever begin : sb_fe
    afifo.get(u_sb_xn);
    `fp_uvm_printf (("SBRD found a XN: \n%s", u_sb_xn.sprint()))
  end : sb_fe
endtask : run_phase 

`endif //  AVALON_MM_MST_SBRD

