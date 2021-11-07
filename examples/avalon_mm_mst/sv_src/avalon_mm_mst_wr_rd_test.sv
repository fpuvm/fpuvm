`ifndef AVALON_MM_MST_WR_RD_TEST 
`define AVALON_MM_MST_WR_RD_TEST 

class avalon_mm_mst_wr_rd_test extends avalon_mm_mst_base_test;

  avalon_mm_mst_wr_rd_seq u_wr_rd_seq;

  `uvm_component_utils_begin (avalon_mm_mst_wr_rd_test)
  `uvm_component_utils_end

  `FP_UVM_COMP_NEW

  extern virtual task main_phase (uvm_phase phase);
endclass : avalon_mm_mst_wr_rd_test 

task avalon_mm_mst_wr_rd_test::main_phase (uvm_phase phase);
  // TBD move this to build_phase
  u_wr_rd_seq = avalon_mm_mst_wr_rd_seq::type_id::create ("u_wr_rd_seq");
  phase.raise_objection (this);
  u_wr_rd_seq.start (u_avalon_mm_mst_env.u_agent.u_avl_mm_sqr);
  phase.drop_objection (this);
endtask : main_phase 

`endif //  AVALON_MM_MST_WR_RD_TEST 

