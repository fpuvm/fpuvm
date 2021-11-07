import fp_uvm_pkg::*;
`include "fp_uvm_macros.svh"

`ifndef AVALON_MM_MST_AGENT
`define AVALON_MM_MST_AGENT

class avalon_mm_mst_agent extends uvm_agent;

  `uvm_component_utils_begin (avalon_mm_mst_agent)
   `uvm_field_enum (uvm_active_passive_enum, is_active, UVM_DEFAULT)
  `uvm_component_utils_end

  virtual AVALON_SLAVE_if vif; 
  avalon_mm_mst_driver u_avl_mm_drv;
  avalon_mm_mst_sequencer u_avl_mm_sqr;
  avalon_mm_mst_monitor u_avl_mm_mon;
  avalon_mm_mst_fcov_sub u_avl_mm_fcov_sub;
  avalon_mm_mst_sbrd u_avl_mm_sbrd;

  `FP_UVM_COMP_NEW

  extern virtual function void build_phase (uvm_phase phase);
  extern virtual function void connect_phase (uvm_phase phase);
endclass : avalon_mm_mst_agent 

function void avalon_mm_mst_agent::build_phase (uvm_phase phase);
  super.build_phase(phase);

  `fp_uvm_display ("Start building VIP Agent")
  `FP_UVM_GET_VIF(AVALON_SLAVE_if) 

  if (is_active == UVM_ACTIVE) begin : act_agent
    u_avl_mm_drv = avalon_mm_mst_driver::type_id::create("u_avl_mm_drv", this);
    u_avl_mm_sqr = avalon_mm_mst_sequencer::type_id::create("u_avl_mm_sqr", this);
  end : act_agent

  u_avl_mm_mon = avalon_mm_mst_monitor::type_id::create ("u_avl_mm_mon", this);
  u_avl_mm_fcov_sub = avalon_mm_mst_fcov_sub::type_id::create ("u_avl_mm_fcov_sub", this);
  u_avl_mm_sbrd = avalon_mm_mst_sbrd::type_id::create ("u_avl_mm_sbrd", this);
  `fp_uvm_display ("Done building VIP Agent")
endfunction : build_phase


function void avalon_mm_mst_agent::connect_phase (uvm_phase phase);
  super.connect_phase(phase);

  `fp_uvm_display ("Start connect_phase in VIP Agent")

  if (is_active == UVM_ACTIVE) begin : act_agent
    u_avl_mm_drv.vif = vif;

    u_avl_mm_drv.seq_item_port.connect (u_avl_mm_sqr.seq_item_export);
  end : act_agent

  u_avl_mm_mon.vif = vif;
  u_avl_mm_mon.aport.connect (u_avl_mm_fcov_sub.analysis_export);
  u_avl_mm_mon.aport.connect (u_avl_mm_sbrd.afifo.analysis_export);
  `fp_uvm_display ("Done connect_phase in VIP Agent")
endfunction : connect_phase

`endif //  AVALON_MM_MST_AGENT

