import fp_uvm_pkg::*;
`include "fp_uvm_macros.svh"

package avalon_mm_pkg;
  typedef enum bit [1:0] {AVALON_IDLE, AVALON_RD, AVALON_WR} avalon_mm_xn_kind_e;
  parameter AVALON_ADDR_W = 16;
  parameter AVALON_DATA_W = 32;

  `include "avalon_mm_mst_inc.sv"

endpackage : avalon_mm_pkg

import avalon_mm_pkg::*;

