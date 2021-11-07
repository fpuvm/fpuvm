`ifndef AVALON_MM_XACTN
`define AVALON_MM_XACTN

class avalon_mm_xactn extends uvm_sequence_item;

  rand avalon_mm_xn_kind_e xn_kind;
  rand bit [AVALON_ADDR_W-1 : 0] addr;
  rand bit [AVALON_DATA_W-1 : 0] wr_data;
  rand bit [1:0] num_bytes;
  rand bit [3:0] num_idle_cyc;
  bit [AVALON_DATA_W-1 : 0] rd_data;

  constraint cst_min_1_byte { num_bytes != 0;}

  `uvm_object_utils_begin (avalon_mm_xactn)
    `uvm_field_enum(avalon_mm_xn_kind_e, xn_kind, UVM_DEFAULT)
    `uvm_field_int (addr, UVM_DEFAULT)
    `uvm_field_int (wr_data, UVM_DEFAULT)
    `uvm_field_int (num_bytes, UVM_DEFAULT)
    `uvm_field_int (rd_data, UVM_DEFAULT)
    `uvm_field_int (num_idle_cyc, UVM_DEFAULT)
  `uvm_object_utils_end

  `FP_UVM_OBJ_NEW
endclass : avalon_mm_xactn 

`endif // AVALON_MM_XACTN

