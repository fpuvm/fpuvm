`ifndef AVALON_MM_MST_ENV
`define AVALON_MM_MST_ENV

class avalon_mm_mst_env extends uvm_env;

  `uvm_component_utils_begin (avalon_mm_mst_env)
  `uvm_component_utils_end

  avalon_mm_mst_agent u_agent;

  `FP_UVM_COMP_NEW

  extern virtual function void build_phase (uvm_phase phase);
endclass : avalon_mm_mst_env 


function void avalon_mm_mst_env::build_phase (uvm_phase phase);
  super.build_phase (phase);

  u_agent = avalon_mm_mst_agent::type_id::create ("u_agent", this);

endfunction : build_phase 

`endif //  AVALON_MM_MST_ENV

