`ifndef AVALON_MM_MST_BASE_TEST
`define AVALON_MM_MST_BASE_TEST

virtual class avalon_mm_mst_base_test extends uvm_test;

  avalon_mm_mst_env u_avalon_mm_mst_env;

  `FP_UVM_COMP_NEW

  extern virtual function void build_phase (uvm_phase phase);
endclass : avalon_mm_mst_base_test 

function void avalon_mm_mst_base_test::build_phase (uvm_phase phase);
  super.build_phase (phase);

  u_avalon_mm_mst_env = avalon_mm_mst_env::type_id::create ("u_avalon_mm_mst_env", this);

endfunction : build_phase 

`endif // AVALON_MM_MST_BASE_TEST


