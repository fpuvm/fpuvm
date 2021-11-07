`ifndef AVALON_MM_MST_DRIVER
`define AVALON_MM_MST_DRIVER

class avalon_mm_mst_driver extends uvm_driver #(avalon_mm_xactn);

  virtual AVALON_SLAVE_if vif; 

  `uvm_component_utils_begin (avalon_mm_mst_driver)
  `uvm_component_utils_end

  `FP_UVM_COMP_NEW
  extern virtual task reset_phase (uvm_phase phase);
  extern virtual task main_phase (uvm_phase phase);
endclass : avalon_mm_mst_driver 

task avalon_mm_mst_driver::reset_phase (uvm_phase phase);

  phase.raise_objection (this);
  super.reset_phase(phase);

  `fp_uvm_display ("Start of Reset")
  vif.drv_cb.nRST <= 0;
  repeat (10) @(vif.drv_cb);
  vif.drv_cb.nRST <= 1;
  @(vif.drv_cb);
  `fp_uvm_display ("End of Reset")

  phase.drop_objection (this);
endtask : reset_phase 

task avalon_mm_mst_driver::main_phase (uvm_phase phase);

  super.main_phase(phase);

  forever begin : drv_fe
    seq_item_port.get_next_item (req);
    `fp_uvm_printf (("Got a new XACTN from SQR: \n%s", req.sprint()) )
    phase.raise_objection (this);
    vif.drv_cb.AVALON_READ <= (req.xn_kind == AVALON_RD) ? 1 : 0;
    vif.drv_cb.AVALON_WRITE <= (req.xn_kind == AVALON_WR) ? 1 : 0;
    vif.drv_cb.AVALON_ADDRESS <= req.addr;
    vif.drv_cb.AVALON_WRITEDATA <= req.wr_data;

    @(vif.drv_cb);
    `fp_uvm_display ("Checking if Avalon Agent has a STALL request ")
    wait (vif.drv_cb.AVALON_WAITREQUEST === 1'b0);
    `fp_uvm_display ("Out of Avalon Agent STALL request ")

    vif.drv_cb.AVALON_READ <= 0;
    vif.drv_cb.AVALON_WRITE <= 0;
    vif.drv_cb.AVALON_ADDRESS <= 'bx;
    vif.drv_cb.AVALON_WRITEDATA <= 'bx;

    repeat (req.num_idle_cyc) begin
      @(vif.drv_cb);
    end

    seq_item_port.item_done();
    `fp_uvm_display ("End of one XACTN")
    phase.drop_objection (this);
  end : drv_fe

endtask : main_phase

`endif // AVALON_MM_MST_DRIVER

