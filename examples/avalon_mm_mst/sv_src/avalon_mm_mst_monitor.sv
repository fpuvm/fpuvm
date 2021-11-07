`ifndef AVALON_MM_MST_MONITOR
`define AVALON_MM_MST_MONITOR

class avalon_mm_mst_monitor extends uvm_monitor;

  uvm_analysis_port #(avalon_mm_xactn) aport;
  avalon_mm_xactn u_mon_xn;
  virtual AVALON_SLAVE_if vif; 

  `uvm_component_utils_begin (avalon_mm_mst_monitor)
  `uvm_component_utils_end

  `FP_UVM_COMP_NEW
  
  extern virtual function void build_phase (uvm_phase phase);
  extern virtual task run_phase (uvm_phase phase);
endclass : avalon_mm_mst_monitor 

function void avalon_mm_mst_monitor::build_phase (uvm_phase phase);
  super.build_phase(phase);
  aport = new ("aport", this);

endfunction : build_phase 

task avalon_mm_mst_monitor::run_phase (uvm_phase phase);
  forever begin : mon_fe
    wait (vif.mon_cb.AVALON_READ || vif.mon_cb.AVALON_WRITE);
    wait (vif.mon_cb.AVALON_WAITREQUEST === 1'b0);
    u_mon_xn = avalon_mm_xactn::type_id::create ("u_mon_xn");
    u_mon_xn.xn_kind = (vif.mon_cb.AVALON_WRITE) ? AVALON_WR : AVALON_RD;

    u_mon_xn.addr = vif.mon_cb.AVALON_ADDRESS;
    if (u_mon_xn.xn_kind == AVALON_WR) begin : wr_xn
      u_mon_xn.wr_data = vif.mon_cb.AVALON_WRITEDATA;
    end : wr_xn
    if (u_mon_xn.xn_kind == AVALON_RD) begin : rd_xn
      wait (vif.mon_cb.AVALON_READDATAVALID);
      u_mon_xn.rd_data = vif.mon_cb.AVALON_READDATA;
    end : rd_xn

    `fp_uvm_printf (("Monitored a new XN: \n%s", u_mon_xn.sprint()))
    aport.write (u_mon_xn);

    @(vif.mon_cb);
  end : mon_fe
endtask : run_phase

`endif //  AVALON_MM_MST_MONITOR

