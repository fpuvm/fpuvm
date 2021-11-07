`ifndef AVALON_MM_MST_FCOV_SUB
`define AVALON_MM_MST_FCOV_SUB

class avalon_mm_mst_fcov_sub extends uvm_subscriber #(avalon_mm_xactn);

  avalon_mm_xactn u_fcov_xn;

  `uvm_component_utils_begin (avalon_mm_mst_fcov_sub)
  `uvm_component_utils_end

  covergroup av_cg;
    addr_cp : coverpoint (u_fcov_xn.addr);
    kind_cp : coverpoint (u_fcov_xn.xn_kind);
    num_bytes_cp : coverpoint (u_fcov_xn.num_bytes);
    cr_addr_kind_byte_en : cross addr_cp, kind_cp, num_bytes_cp;
  endgroup : av_cg

  function new (string name = "avalon_mm_mst_fcov_sub", uvm_component parent);
    super.new (name, parent);
    av_cg = new ();
  endfunction : new 

  extern virtual function void write (avalon_mm_xactn t);
endclass : avalon_mm_mst_fcov_sub 

function void avalon_mm_mst_fcov_sub::write (avalon_mm_xactn t);
  u_fcov_xn = t;
  av_cg.sample();
endfunction : write 

`endif //  AVALON_MM_MST_FCOV_SUB

