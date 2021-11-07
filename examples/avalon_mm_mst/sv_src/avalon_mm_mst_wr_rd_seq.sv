`ifndef AVALON_MM_MST_WR_RD_SEQ
`define AVALON_MM_MST_WR_RD_SEQ
class avalon_mm_mst_wr_rd_seq extends uvm_sequence #(avalon_mm_xactn);
  avalon_mm_xactn item;

  `uvm_object_utils_begin (avalon_mm_mst_wr_rd_seq)
  `uvm_object_utils_end
  `FP_UVM_OBJ_NEW
  extern virtual task body ();
endclass : avalon_mm_mst_wr_rd_seq 

task avalon_mm_mst_wr_rd_seq::body ();
  repeat (10) begin
    `uvm_do_with (req, {xn_kind == AVALON_IDLE;})
    `uvm_do(item)
  end
endtask : body 

`endif // AVALON_MM_MST_WR_RD_SEQ


