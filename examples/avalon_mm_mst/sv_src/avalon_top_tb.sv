import fp_uvm_pkg::*;
`include "fp_uvm_macros.svh"


module top;
  import avalon_mm_pkg::*;

  bit CLK;
  bit nRST;
  bit R;
  bit W;
  bit [15:0] ADDRESS;
  bit [3:0] BYTEENABLE;
  bit [31:0] D_FROM_AVALON;
  bit [31:0] D_TO_AVALON;
  bit [1:0] TWAIT;

  always #10 CLK = ~CLK;

  AVALON_SLAVE_if u_avl_if (.*);

	AVALON_SLAVE dut (
			.CLK		            (u_avl_if.CLK),
			.nRST		            (u_avl_if.nRST),
			.AVALON_ADDRESS		    (u_avl_if.AVALON_ADDRESS),
			.AVALON_BYTEENABLE		(u_avl_if.AVALON_BYTEENABLE),
			.AVALON_READ		    (u_avl_if.AVALON_READ),
			.AVALON_WAITREQUEST		(u_avl_if.AVALON_WAITREQUEST),
			.AVALON_WRITE		    (u_avl_if.AVALON_WRITE),
			.AVALON_WRITEDATA		(u_avl_if.AVALON_WRITEDATA),
			.AVALON_READDATA		(u_avl_if.AVALON_READDATA),
			.AVALON_READDATAVALID	(u_avl_if.AVALON_READDATAVALID),
			.R_LONG		            (R),
			.W_SHORT		        (W),
			.ADDRESS		        (ADDRESS),
			.BYTEENABLE		        (BYTEENABLE),
			.D_FROM_AVALON		    (D_FROM_AVALON),
			.D_TO_AVALON		    (D_TO_AVALON),
			.TWAIT		            (TWAIT)
		);


  initial begin 
    uvm_config_db #(virtual AVALON_SLAVE_if)::set (
      .cntxt (null),
      .inst_name ("uvm_test_top.u_avalon_mm_mst_env.u_agent"),
      .field_name ("vif"),
      .value (u_avl_if) );

    run_test("avalon_mm_mst_wr_rd_test");
  end
endmodule : top

