`timescale 1ns/1ps

// ===== Centralized filename defaults (can be overridden by +args) =====
`define DEFAULT_DMEM_FILE        "mem/dmem.fill"
`define DEFAULT_IMEM_FILE        "mem/imem_2.fill"
`define DEFAULT_LOG_FILE         "PE_Test_Results_2.txt"
`define DEFAULT_DMEM_OUT_FILE    "PE_DataMemory_Dump_2.txt"
`define DEFAULT_RPT_DUMP_FILE    "report/dmem_2.dump"

// ===== Includes (so Makefile only compiles ./design & ./tb but still gets memory RTL) =====
`include "./include/dmem.v"
`include "./include/imem.v"

// ====== Top-level TB ======
module tb_PE;

  // ===== Centralized file name registers (can be overridden via +args) =====
  // Use +IMEM=... +DMEM=... +LOG_FILE=... +DMEM_OUT=... +RPT_FILE=...
  reg [1023:0] IMEM_FILE, DMEM_FILE;
  reg [1023:0] LOG_FILE, DMEM_OUT_FILE, RPT_DUMP_FILE;

  // ========== Logger ==========
  integer LOG_FD;

  // ---- Set filenames (from +args or defaults) and open LOG ----
  initial begin
    if (!$value$plusargs("IMEM=%s",     IMEM_FILE))     IMEM_FILE     = `DEFAULT_IMEM_FILE;
    if (!$value$plusargs("DMEM=%s",     DMEM_FILE))     DMEM_FILE     = `DEFAULT_DMEM_FILE;
    if (!$value$plusargs("LOG_FILE=%s", LOG_FILE))      LOG_FILE      = `DEFAULT_LOG_FILE;
    if (!$value$plusargs("DMEM_OUT=%s", DMEM_OUT_FILE)) DMEM_OUT_FILE = `DEFAULT_DMEM_OUT_FILE;
    if (!$value$plusargs("RPT_FILE=%s", RPT_DUMP_FILE)) RPT_DUMP_FILE = `DEFAULT_RPT_DUMP_FILE;

    LOG_FD = $fopen(LOG_FILE, "w");
    if (!LOG_FD) $display("** ERROR ** cannot open %0s", LOG_FILE);
    $fdisplay(LOG_FD, "==== PE Test Results ====");
    $fdisplay(LOG_FD, "Time unit = %0t (timescale 1ns/1ps)\n", $time);
    $fdisplay(LOG_FD, "IMEM=%0s", IMEM_FILE);
    $fdisplay(LOG_FD, "DMEM=%0s", DMEM_FILE);
  end

  // -----------------------------
  // DUT ports (ascending ranges)
  // -----------------------------
  reg         clk, reset;
  wire [0:31] Instr_from_imem;
  wire [0:31] PC;

  wire        memEn_to_dmem, memWrEn_to_dmem;
  wire [0:31] memAddr_to_dmem;
  wire [0:63] data_to_dmem;
  wire [0:63] data_from_dmem;

  wire [0:1]  addr_nic;
  wire [0:63] din_to_nic;
  reg  [0:63] dout_from_nic;   // simple NIC: feed zeros
  wire        nicEn, nicWrEn;

  // -----------------------------
  // Instantiate DUT
  // -----------------------------
  TOP dut(
    .clk(clk), .reset(reset),
    .Instr_from_imem(Instr_from_imem),
    .PC(PC),
    .memEn_to_dmem(memEn_to_dmem), .memWrEn_to_dmem(memWrEn_to_dmem),
    .memAddr_to_dmem(memAddr_to_dmem),
    .data_to_dmem(data_to_dmem),
    .data_from_dmem(data_from_dmem),
    .addr_nic(addr_nic),
    .din_to_nic(din_to_nic),
    .dout_from_nic(dout_from_nic),
    .nicEn(nicEn), .nicWrEn(nicWrEn)
  );

  // -----------------------------
  // Memories (1× imem, 1× dmem)
  //   - TOP exposes 32-bit PC/addr; these memories use 8-bit addresses
  //   - Follow TA's convention: imem uses PC[22:29], dmem uses addr[24:31]
  // -----------------------------
  wire [0:31] imem_data;
  imem IM (
    .memAddr(PC[22:29]),   // 8-bit window
    .dataOut(imem_data)
  );
  assign Instr_from_imem = imem_data;

  dmem DM (
    .clk    (clk),
    .memEn  (memEn_to_dmem),
    .memWrEn(memWrEn_to_dmem),
    .memAddr(memAddr_to_dmem[24:31]), // 8-bit window
    .dataIn (data_to_dmem),
    .dataOut(data_from_dmem)
  );

  // NIC: return zero for this test
  initial dout_from_nic = 64'd0;

  // -----------------------------
  // Clock
  // -----------------------------
  initial clk = 1'b0;
  always #2 clk = ~clk; // 250 MHz

  // -----------------------------
  // Load .fill files (support plusargs; defaults defined above)
  // -----------------------------
  initial begin
    $display("[TB] Loading IMEM from %0s", IMEM_FILE);
    $display("[TB] Loading DMEM from %0s", DMEM_FILE);
    $readmemh(IMEM_FILE, IM.MEM);
    $readmemh(DMEM_FILE, DM.MEM);
    // quick peek
    $display("[TB] IM[0]=%h IM[1]=%h", IM.MEM[0], IM.MEM[1]);
    $display("[TB] DM[0]=%h DM[1]=%h", DM.MEM[0], DM.MEM[1]);
  end

  // -----------------------------
  // Test constants
  // -----------------------------
  localparam [0:63] A_INIT = 64'h1122334455667788;
  localparam [0:63] B_INIT = 64'hF0F00F0FA5A55A5A;
  localparam [0:63] C_INIT = 64'h0000000000000009; // avoid div0
  localparam [0:63] D_INIT = 64'h0123456789ABCDEF;

  // -----------------------------
  // Integer square-root helpers
  // -----------------------------
  function [0:7]  isqrt8;  input [0:7]  x; integer k; reg [0:7]  y; begin
    y = 0; for (k=7; k>=0; k=k-1)  if ((y+(1<<k))*(y+(1<<k)) <= x)  y = y + (1<<k);
    isqrt8 = y;
  end endfunction

  function [0:15] isqrt16; input [0:15] x; integer k; reg [0:15] y; begin
    y = 0; for (k=15; k>=0; k=k-1) if ((y+(1<<k))*(y+(1<<k)) <= x)  y = y + (1<<k);
    isqrt16 = y;
  end endfunction

  function [0:15] isqrt32; input [0:31] x; integer k; reg [0:15] y; begin
    y = 0; for (k=15; k>=0; k=k-1) if ((y+(1<<k))*(y+(1<<k)) <= x)  y = y + (1<<k);
    isqrt32 = y;
  end endfunction

  function [0:31] isqrt64; input [0:63] x; integer k; reg [0:31] y; begin
    y = 0; for (k=31; k>=0; k=k-1) if ((y+(1<<k))*(y+(1<<k)) <= x)  y = y + (1<<k);
    isqrt64 = y;
  end endfunction

  // -----------------------------
  // Golden ALU model (matches your original ops; VSQRT fixed)
  // -----------------------------
  function [0:63] model_alu;
    input [0:5]  func;
    input [0:1]  ww;
    input [0:63] A, B;
    reg   [0:63] R;
  begin
    R = 64'd0;
    case (func)
      6'b000001: R = A & B;         // VAND
      6'b000010: R = A | B;         // VOR
      6'b000011: R = A ^ B;         // VXOR
      6'b000100: R = ~A;            // VNOT
      6'b000101: R = A;             // VMOV
      6'b000110: begin              // VADD
        if (ww==2'b11) R = A + B;
        else if (ww==2'b10) begin
          R[0:31]  = A[0:31]  + B[0:31];
          R[32:63] = A[32:63] + B[32:63];
        end
        else if (ww==2'b01) begin
          R[0:15]   = A[0:15]   + B[0:15];
          R[16:31]  = A[16:31]  + B[16:31];
          R[32:47]  = A[32:47]  + B[32:47];
          R[48:63]  = A[48:63]  + B[48:63];
        end
        else begin
          R[0:7]    = A[0:7]    + B[0:7];
          R[8:15]   = A[8:15]   + B[8:15];
          R[16:23]  = A[16:23]  + B[16:23];
          R[24:31]  = A[24:31]  + B[24:31];
          R[32:39]  = A[32:39]  + B[32:39];
          R[40:47]  = A[40:47]  + B[40:47];
          R[48:55]  = A[48:55]  + B[48:55];
          R[56:63]  = A[56:63]  + B[56:63];
        end
      end
      6'b000111: begin              // VSUB
        if (ww==2'b11) R = A - B;
        else if (ww==2'b10) begin
          R[0:31]  = A[0:31]  - B[0:31];
          R[32:63] = A[32:63] - B[32:63];
        end
        else if (ww==2'b01) begin
          R[0:15]   = A[0:15]   - B[0:15];
          R[16:31]  = A[16:31]  - B[16:31];
          R[32:47]  = A[32:47]  - B[32:47];
          R[48:63]  = A[48:63]  - B[48:63];
        end
        else begin
          R[0:7]    = A[0:7]    - B[0:7];
          R[8:15]   = A[8:15]   - B[8:15];
          R[16:23]  = A[16:23]  - B[16:23];
          R[24:31]  = A[24:31]  - B[24:31];
          R[32:39]  = A[32:39]  - B[32:39];
          R[40:47]  = A[40:47]  - B[40:47];
          R[48:55]  = A[48:55]  - B[48:55];
          R[56:63]  = A[56:63]  - B[56:63];
        end
      end
      // VMULEU (even lanes)
      6'b001000: begin
        R = 64'd0;
        if (ww==2'b10) begin
          R[0:63] = A[0:31] * B[0:31];
        end else if (ww==2'b01) begin
          R[0:31]  = A[0:15]  * B[0:15];
          R[32:63] = A[32:47] * B[32:47];
        end else begin
          R[0:15]   = A[0:7]   * B[0:7];
          R[16:31]  = A[16:23] * B[16:23];
          R[32:47]  = A[32:39] * B[32:39];
          R[48:63]  = A[48:55] * B[48:55];
        end
      end
      // VMULOU (odd lanes)
      6'b001001: begin
        R = 64'd0;
        if (ww==2'b10) begin
          R[0:63] = A[32:63] * B[32:63];
        end else if (ww==2'b01) begin
          R[0:31]  = A[16:31] * B[16:31];
          R[32:63] = A[48:63] * B[48:63];
        end else begin
          R[0:15]   = A[8:15]  * B[8:15];
          R[16:31]  = A[24:31] * B[24:31];
          R[32:47]  = A[40:47] * B[40:47];
          R[48:63]  = A[56:63] * B[56:63];
        end
      end
      // VSLL
      6'b001010: begin
        if (ww==2'b11) R = A << B[58:63];
        else if (ww==2'b10) begin
          R[0:31]  = A[0:31]  << B[27:31];
          R[32:63] = A[32:63] << B[59:63];
        end
        else if (ww==2'b01) begin
          R[0:15]   = A[0:15]   << B[12:15];
          R[16:31]  = A[16:31]  << B[28:31];
          R[32:47]  = A[32:47]  << B[44:47];
          R[48:63]  = A[48:63]  << B[60:63];
        end
        else begin
          R[0:7]    = A[0:7]    << B[5:7];
          R[8:15]   = A[8:15]   << B[13:15];
          R[16:23]  = A[16:23]  << B[21:23];
          R[24:31]  = A[24:31]  << B[29:31];
          R[32:39]  = A[32:39]  << B[37:39];
          R[40:47]  = A[40:47]  << B[45:47];
          R[48:55]  = A[48:55]  << B[53:55];
          R[56:63]  = A[56:63]  << B[61:63];
        end
      end
      // VSRL
      6'b001011: begin
        if (ww==2'b11) R = A >> B[58:63];
        else if (ww==2'b10) begin
          R[0:31]  = A[0:31]  >> B[27:31];
          R[32:63] = A[32:63] >> B[59:63];
        end
        else if (ww==2'b01) begin
          R[0:15]   = A[0:15]   >> B[12:15];
          R[16:31]  = A[16:31]  >> B[28:31];
          R[32:47]  = A[32:47]  >> B[44:47];
          R[48:63]  = A[48:63]  >> B[60:63];
        end
        else begin
          R[0:7]    = A[0:7]    >> B[5:7];
          R[8:15]   = A[8:15]   >> B[13:15];
          R[16:23]  = A[16:23]  >> B[21:23];
          R[24:31]  = A[24:31]  >> B[29:31];
          R[32:39]  = A[32:39]  >> B[37:39];
          R[40:47]  = A[40:47]  >> B[45:47];
          R[48:55]  = A[48:55]  >> B[53:55];
          R[56:63]  = A[56:63]  >> B[61:63];
        end
      end
      // VSRA
      6'b001100: begin
        if (ww==2'b11) R = $signed(A) >>> B[58:63];
        else if (ww==2'b10) begin
          R[0:31]  = $signed(A[0:31])  >>> B[27:31];
          R[32:63] = $signed(A[32:63]) >>> B[59:63];
        end
        else if (ww==2'b01) begin
          R[0:15]   = $signed(A[0:15])   >>> B[12:15];
          R[16:31]  = $signed(A[16:31])  >>> B[28:31];
          R[32:47]  = $signed(A[32:47])  >>> B[44:47];
          R[48:63]  = $signed(A[48:63])  >>> B[60:63];
        end
        else begin
          R[0:7]    = $signed(A[0:7])    >>> B[5:7];
          R[8:15]   = $signed(A[8:15])   >>> B[13:15];
          R[16:23]  = $signed(A[16:23])  >>> B[21:23];
          R[24:31]  = $signed(A[24:31])  >>> B[29:31];
          R[32:39]  = $signed(A[32:39])  >>> B[37:39];
          R[40:47]  = $signed(A[40:47])  >>> B[45:47];
          R[48:55]  = $signed(A[48:55])  >>> B[53:55];
          R[56:63]  = $signed(A[56:63])  >>> B[61:63];
        end
      end
      // VRTTH
      6'b001101: begin
        if (ww==2'b11) begin
          R[0:31]  = A[32:63];
          R[32:63] = A[0:31];
        end else if (ww==2'b10) begin
          R[0:15]  = A[16:31];  R[16:31] = A[0:15];
          R[32:47] = A[48:63];  R[48:63] = A[32:47];
        end else if (ww==2'b01) begin
          R[0:7]   = A[8:15];   R[8:15]  = A[0:7];
          R[16:23] = A[24:31];  R[24:31] = A[16:23];
          R[32:39] = A[40:47];  R[40:47] = A[32:39];
          R[48:55] = A[56:63];  R[56:63] = A[48:55];
        end else begin
          R[0:3]   = A[4:7];    R[4:7]   = A[0:3];
          R[8:11]  = A[12:15];  R[12:15] = A[8:11];
          R[16:19] = A[20:23];  R[20:23] = A[16:19];
          R[24:27] = A[28:31];  R[28:31] = A[24:27];
          R[32:35] = A[36:39];  R[36:39] = A[32:35];
          R[40:43] = A[44:47];  R[44:47] = A[40:43];
          R[48:51] = A[52:55];  R[52:55] = A[48:51];
          R[56:59] = A[60:63];  R[60:63] = A[56:59];
        end
      end
      // VDIV
      6'b001110: begin
        if (ww==2'b11) R = (B!=0) ? (A/B) : 64'd0;
        else if (ww==2'b10) begin
          R[0:31]  = (B[0:31]  != 0) ? (A[0:31]  / B[0:31])  : 32'd0;
          R[32:63] = (B[32:63] != 0) ? (A[32:63] / B[32:63]) : 32'd0;
        end
        else if (ww==2'b01) begin
          R[0:15]   = (B[0:15]   != 0) ? (A[0:15]   / B[0:15])   : 16'd0;
          R[16:31]  = (B[16:31]  != 0) ? (A[16:31]  / B[16:31])  : 16'd0;
          R[32:47]  = (B[32:47]  != 0) ? (A[32:47]  / B[32:47])  : 16'd0;
          R[48:63]  = (B[48:63]  != 0) ? (A[48:63]  / B[48:63])  : 16'd0;
        end
        else begin
          R[0:7]    = (B[0:7]    != 0) ? (A[0:7]    / B[0:7])    : 8'd0;
          R[8:15]   = (B[8:15]   != 0) ? (A[8:15]   / B[8:15])   : 8'd0;
          R[16:23]  = (B[16:23]  != 0) ? (A[16:23]  / B[16:23])  : 8'd0;
          R[24:31]  = (B[24:31]  != 0) ? (A[24:31]  / B[24:31])  : 8'd0;
          R[32:39]  = (B[32:39]  != 0) ? (A[32:39]  / B[32:39])  : 8'd0;
          R[40:47]  = (B[40:47]  != 0) ? (A[40:47]  / B[40:47])  : 8'd0;
          R[48:55]  = (B[48:55]  != 0) ? (A[48:55]  / B[48:55])  : 8'd0;
          R[56:63]  = (B[56:63]  != 0) ? (A[56:63]  / B[56:63])  : 8'd0;
        end
      end
      // VMOD
      6'b001111: begin
        if (ww==2'b11) R = (B!=0) ? (A%B) : 64'd0;
        else if (ww==2'b10) begin
          R[0:31]  = (B[0:31]  != 0) ? (A[0:31]  % B[0:31])  : 32'd0;
          R[32:63] = (B[32:63] != 0) ? (A[32:63] % B[32:63]) : 32'd0;
        end
        else if (ww==2'b01) begin
          R[0:15]   = (B[0:15]   != 0) ? (A[0:15]   % B[0:15])   : 16'd0;
          R[16:31]  = (B[16:31]  != 0) ? (A[16:31]  % B[16:31])  : 16'd0;
          R[32:47]  = (B[32:47]  != 0) ? (A[32:47]  % B[32:47])  : 16'd0;
          R[48:63]  = (B[48:63]  != 0) ? (A[48:63]  % B[48:63])  : 16'd0;
        end
        else begin
          R[0:7]    = (B[0:7]    != 0) ? (A[0:7]    % B[0:7])    : 8'd0;
          R[8:15]   = (B[8:15]   != 0) ? (A[8:15]   % B[8:15])   : 8'd0;
          R[16:23]  = (B[16:23]  != 0) ? (A[16:23]  % B[16:23])  : 8'd0;
          R[24:31]  = (B[24:31]  != 0) ? (A[24:31]  % B[24:31])  : 8'd0;
          R[32:39]  = (B[32:39]  != 0) ? (A[32:39]  % B[32:39])  : 8'd0;
          R[40:47]  = (B[40:47]  != 0) ? (A[40:47]  % B[40:47])  : 8'd0;
          R[48:55]  = (B[48:55]  != 0) ? (A[48:55]  % B[48:55])  : 8'd0;
          R[56:63]  = (B[56:63]  != 0) ? (A[56:63]  % B[56:63])  : 8'd0;
        end
      end
      // VSQEU
      6'b010000: begin
        R = 64'd0;
        if (ww == 2'b00) begin
          R[0:15]   = A[0:7]   * A[0:7];
          R[16:31]  = A[16:23] * A[16:23];
          R[32:47]  = A[32:39] * A[32:39];
          R[48:63]  = A[48:55] * A[48:55];
        end
        else if (ww == 2'b01) begin
          R[0:31]   = A[0:15]  * A[0:15];
          R[32:63]  = A[32:47] * A[32:47];
        end
        else if (ww == 2'b10) begin
          R         = A[0:31]  * A[0:31];
        end
        else begin
          R         = 64'h0;
        end
      end
      // VSQOU
      6'b010001: begin
        R = 64'd0;
        if (ww == 2'b00) begin
          R[0:15]   = A[8:15]  * A[8:15];
          R[16:31]  = A[24:31] * A[24:31];
          R[32:47]  = A[40:47] * A[40:47];
          R[48:63]  = A[56:63] * A[56:63];
        end
        else if (ww == 2'b01) begin
          R[0:31]   = A[16:31] * A[16:31];
          R[32:63]  = A[48:63] * A[48:63];
        end
        else if (ww == 2'b10) begin
          R         = A[32:63] * A[32:63];
        end
        else begin
          R         = 64'h0;
        end
      end
      // VSQRT — per-lane integer sqrt
      6'b010010: begin
        if (ww==2'b11) begin
          R = 64'd0;
          R[32:63] = isqrt64(A);          // place 32b sqrt in upper half (per your prior spec)
        end
        else if (ww==2'b10) begin
          R[0:31]   = isqrt32(A[0:31]);
          R[32:63]  = isqrt32(A[32:63]);
        end
        else if (ww==2'b01) begin
          R[0:15]   = isqrt16(A[0:15]);
          R[16:31]  = isqrt16(A[16:31]);
          R[32:47]  = isqrt16(A[32:47]);
          R[48:63]  = isqrt16(A[48:63]);
        end
        else begin
          R[0:7]    = isqrt8(A[0:7]);
          R[8:15]   = isqrt8(A[8:15]);
          R[16:23]  = isqrt8(A[16:23]);
          R[24:31]  = isqrt8(A[24:31]);
          R[32:39]  = isqrt8(A[32:39]);
          R[40:47]  = isqrt8(A[40:47]);
          R[48:55]  = isqrt8(A[48:55]);
          R[56:63]  = isqrt8(A[56:63]);
        end
      end
      default: R = 64'd0;
    endcase
    model_alu = R;
  end
  endfunction

  // -----------------------------
  // Drive / Check (uses dut.* signal names)
  // -----------------------------
  task drive_and_check;
    input [0:5]   func;
    input [0:1]   ww;
    input [0:63]  A;
    input [0:63]  B;
    input [0:127] tag;
    reg   [0:159] v;
    reg   [0:63]  exp, got1, got2;
    integer fail;
  begin
    exp = model_alu(func, ww, A, B);

    v               = {160{1'b0}};
    v[0:5]          = 6'b101010; // opcode = ALU
    v[24:25]        = ww;
    v[26:31]        = func;
    v[32:95]        = A;
    v[96:159]       = B;

    force dut.stage2_ID_EXMEM_out = v;

    #1; // comb settle
    got1 = dut.ALU_data_out;

    @(posedge clk);
    #1;
    got2 = dut.stage3_EXMEM_WB_out[9:72];

    release dut.stage2_ID_EXMEM_out;

    fail = 0;
    if (got1 !== exp) begin
      $display("[FAIL-COMB] func=%0d ww=%0d tag=%0s A=%h B=%h exp=%h got=%h (ALU_data_out)",
               func, ww, tag, A, B, exp, got1);
      $fdisplay(LOG_FD, "[FAIL-COMB] func=%0d ww=%0d tag=%0s A=%h B=%h exp=%h got=%h (ALU_data_out)",
               func, ww, tag, A, B, exp, got1);
      fail = 1;
    end
    if (got2 !== exp) begin
      $display("[FAIL-WB]   func=%0d ww=%0d tag=%0s A=%h B=%h exp=%h got=%h (stage3 data)",
               func, ww, tag, A, B, exp, got2);
      $fdisplay(LOG_FD, "[FAIL-WB]   func=%0d ww=%0d tag=%0s A=%h B=%h exp=%h got=%h (stage3 data)",
               func, ww, tag, A, B, exp, got2);
      fail = 1;
    end
    if (!fail) begin
      $display("[PASS] func=%0d ww=%0d tag=%0s -> %h", func, ww, tag, exp);
      $fdisplay(LOG_FD, "[PASS] func=%0d ww=%0d tag=%0s -> %h", func, ww, tag, exp);
    end
    if (fail)  begin
      $display("** TEST FAILED **");
      $fdisplay(LOG_FD, "** TEST FAILED **");
      $fclose(LOG_FD);
      dump_dmem_and_finish; // also dump on failure
    end
  end
  endtask

  // -----------------------------
  // Phase control
  // -----------------------------
  reg alu_phase_done;
  initial alu_phase_done = 1'b0;

  // -----------------------------
  // Global reset sequence (used at start and before program run)
  // -----------------------------
  task do_reset;
  begin
    reset = 1'b1;
    repeat (5) @(posedge clk);
    reset = 1'b0;
  end
  endtask

  // -----------------------------
  // Phase 1: ALU vector tests
  // -----------------------------
  initial begin : PHASE1_ALU
    do_reset;

    // bitwise basics
    drive_and_check(6'b000001, 2'b11, A_INIT, B_INIT, "VAND 64");
    drive_and_check(6'b000010, 2'b11, A_INIT, B_INIT, "VOR 64");
    drive_and_check(6'b000011, 2'b11, A_INIT, B_INIT, "VXOR 64");
    drive_and_check(6'b000100, 2'b11, A_INIT, 64'd0 , "VNOT 64");
    drive_and_check(6'b000101, 2'b11, A_INIT, 64'd0 , "VMOV 64");

    // add/sub across widths
    drive_and_check(6'b000110, 2'b10, A_INIT, B_INIT, "VADD 32x2");
    drive_and_check(6'b000110, 2'b01, A_INIT, B_INIT, "VADD 16x4");
    drive_and_check(6'b000110, 2'b00, A_INIT, B_INIT, "VADD 8x8");
    drive_and_check(6'b000111, 2'b10, A_INIT, B_INIT, "VSUB 32x2");
    drive_and_check(6'b000111, 2'b01, A_INIT, B_INIT, "VSUB 16x4");
    drive_and_check(6'b000111, 2'b00, A_INIT, B_INIT, "VSUB 8x8");

    // mul even/odd
    drive_and_check(6'b001000, 2'b00, A_INIT, B_INIT, "VMULEU 8x8");
    drive_and_check(6'b001000, 2'b01, A_INIT, B_INIT, "VMULEU 16x4");
    drive_and_check(6'b001000, 2'b10, A_INIT, B_INIT, "VMULEU 32x2");
    drive_and_check(6'b001001, 2'b00, A_INIT, B_INIT, "VMULOU 8x8");
    drive_and_check(6'b001001, 2'b01, A_INIT, B_INIT, "VMULOU 16x4");
    drive_and_check(6'b001001, 2'b10, A_INIT, B_INIT, "VMULOU 32x2");

    // shifts & rotate
    drive_and_check(6'b001010, 2'b11, A_INIT, C_INIT, "VSLL 64");
    drive_and_check(6'b001011, 2'b10, A_INIT, C_INIT, "VSRL 32x2");
    drive_and_check(6'b001100, 2'b01, A_INIT, C_INIT, "VSRA 16x4");
    drive_and_check(6'b001101, 2'b00, A_INIT, 64'd0 , "VRTTH 8x8");

    // div/mod (avoid div-by-zero)
    drive_and_check(6'b001110, 2'b11, D_INIT, C_INIT, "VDIV 64");
    drive_and_check(6'b001110, 2'b10, D_INIT, {C_INIT[32:63], C_INIT[32:63]}, "VDIV 32x2");
    drive_and_check(6'b001111, 2'b01, D_INIT, {4{C_INIT[48:63]}}, "VMOD 16x4");

    // square (even/odd)
    drive_and_check(6'b010000, 2'b10, D_INIT, 64'd0, "VSQEU 32x2");
    drive_and_check(6'b010000, 2'b01, D_INIT, 64'd0, "VSQEU 16x4");
    drive_and_check(6'b010000, 2'b00, D_INIT, 64'd0, "VSQEU 8x8");

    drive_and_check(6'b010001, 2'b10, D_INIT, 64'd0, "VSQOU 32x2");
    drive_and_check(6'b010001, 2'b01, D_INIT, 64'd0, "VSQOU 16x4");
    drive_and_check(6'b010001, 2'b00, D_INIT, 64'd0, "VSQOU 8x8");

    // sqrt
    drive_and_check(6'b010010, 2'b11, C_INIT, 64'd0, "VSQRT 64");
    drive_and_check(6'b010010, 2'b10, {C_INIT[32:63], C_INIT[32:63]}, 64'd0, "VSQRT 32x2");
    drive_and_check(6'b010010, 2'b01, {4{C_INIT[48:63]}}, 64'd0, "VSQRT 16x4");
    drive_and_check(6'b010010, 2'b00, {8{C_INIT[56:63]}},  64'd0, "VSQRT 8x8");

    $display("=== ALL ALU FUNCTION CODES EXERCISED ===");
    $fdisplay(LOG_FD, "=== ALL ALU FUNCTION CODES EXERCISED ===");

    alu_phase_done = 1'b1; // handoff to program phase
  end

   // -----------------------------
   // Phase 2: Real program run from IMEM, then dump DMEM
   // -----------------------------
   integer DM_DUMP_FD, i_dump, rpt_fd;

   // 等 Phase 1 完成後再 reset 一次，開始跑程式
   initial begin : PHASE2_START
     wait (alu_phase_done === 1'b1);
     do_reset;
   end

   // 監看 NOP（32'h0）作為程式結束條件
   initial begin : RUN_TILL_NOP
     // 確保先等到 Phase 2 的 reset 做完才監看
     wait (alu_phase_done === 1'b1);
     // 等到取到 NOP
     wait (Instr_from_imem == 32'h0000_0000);
     // 清管線
     repeat (5) @(negedge clk);
     // Dump & finish（內含 $finish;）
     dump_dmem_and_finish;
   end

   // 看門狗（避免卡死）
   initial begin : WATCHDOG
     wait (alu_phase_done === 1'b1);
     repeat (20000) @(posedge clk); // ~80us 依你時脈
     $display("** WATCHDOG TIMEOUT: dumping DMEM and finishing **");
     dump_dmem_and_finish;
   end

  // -----------------------------
  // Dump DMEM first 128 entries and finish
  // -----------------------------
  task dump_dmem_and_finish;
  begin
    // 使用集中管理後的檔名
    rpt_fd     = $fopen(RPT_DUMP_FILE,"w");
    //DM_DUMP_FD = $fopen(DMEM_OUT_FILE,"w");

    //if (!DM_DUMP_FD) $display("** ERROR ** cannot open %0s", DMEM_OUT_FILE);
    if (!rpt_fd)     $display("** WARNING ** cannot open %0s", RPT_DUMP_FILE);

    for (i_dump = 0; i_dump < 128; i_dump = i_dump + 1) begin
      $display("Memory location #  %0d : %h", i_dump, DM.MEM[i_dump]);
      //if (DM_DUMP_FD) $fdisplay(DM_DUMP_FD, "Memory location #  %0d : %h", i_dump, DM.MEM[i_dump]);
      if (rpt_fd)     $fdisplay(rpt_fd,      "Memory location #%4d : %h", i_dump, DM.MEM[i_dump]);
    end

    //if (DM_DUMP_FD) $fclose(DM_DUMP_FD);
    if (rpt_fd)     $fclose(rpt_fd);
    if (LOG_FD)     $fclose(LOG_FD);
    $finish;
  end
  endtask

endmodule
