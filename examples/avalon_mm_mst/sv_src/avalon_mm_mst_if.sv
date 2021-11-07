// Generating SystemVerilog interface for module: AVALON_SLAVE
// ---------------------------------------------------------
interface AVALON_SLAVE_if (input logic CLK, output logic nRST);
  logic [15 :0] AVALON_ADDRESS;
  logic [3 :0] AVALON_BYTEENABLE;
  logic AVALON_READ;
  logic AVALON_WRITE;
  logic [31 :0] AVALON_WRITEDATA;
  logic [31 :0] D_TO_AVALON;
  logic [1 :0] TWAIT;
  logic [15 :0] ADDRESS;
  logic [31 :0] AVALON_READDATA;
  logic AVALON_READDATAVALID;
  logic AVALON_WAITREQUEST;
  logic [3 :0] BYTEENABLE;
  logic [31 :0] D_FROM_AVALON;
  logic R_LONG;
  logic R_SHORT;
  logic W_LONG;
  logic W_SHORT;
  // Endinterface signals 


  // Start clocking block definition 
  clocking drv_cb @(posedge CLK);
    output AVALON_ADDRESS;
    output AVALON_BYTEENABLE;
    output AVALON_READ;
    output AVALON_WRITE;
    output AVALON_WRITEDATA;
    output D_TO_AVALON;
    output TWAIT;
    output nRST;
    input ADDRESS;
    input AVALON_READDATA;
    input AVALON_READDATAVALID;
    input AVALON_WAITREQUEST;
    input BYTEENABLE;
    input D_FROM_AVALON;
    input R_LONG;
    input R_SHORT;
    input W_LONG;
    input W_SHORT;
  endclocking : drv_cb

  clocking mon_cb @(posedge CLK);
    input AVALON_ADDRESS;
    input AVALON_BYTEENABLE;
    input AVALON_READ;
    input AVALON_WRITE;
    input AVALON_WRITEDATA;
    input D_TO_AVALON;
    input TWAIT;
    input nRST;
    input ADDRESS;
    input AVALON_READDATA;
    input AVALON_READDATAVALID;
    input AVALON_WAITREQUEST;
    input BYTEENABLE;
    input D_FROM_AVALON;
    input R_LONG;
    input R_SHORT;
    input W_LONG;
    input W_SHORT;
  endclocking : mon_cb

  // Endclocking block definition 
  //
  initial begin
    AVALON_ADDRESS = 0;
    AVALON_BYTEENABLE = 0;
    AVALON_READ = 0;
    AVALON_WRITE = 0;
    AVALON_WRITEDATA = 0;
    D_TO_AVALON = 0;
    TWAIT = 0;
    nRST = 0;
  end

endinterface : AVALON_SLAVE_if

