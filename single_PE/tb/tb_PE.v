`timescale 1ns/1ps

module tb_PE;

  // -----------------------------
  // DUT ports
  // -----------------------------
  reg         clk, reset;
  reg  [31:0] Instr_from_imem;
  wire [31:0] PC;

  wire        memEn_to_dmem, memWrEn_to_dmem;
  wire [31:0] memAddr_to_dmem;
  wire [63:0] data_to_dmem;
  reg  [63:0] data_from_dmem;

  wire [1:0]  addr_nic;
  wire [63:0] din_to_nic;
  reg  [63:0] dout_from_nic;
  wire        nicEn, nicWrEn;

  // Instantiate DUT (port list依你的TOP.v，如名稱不同請同步修改)
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
  // Clock / Reset
  // -----------------------------
  initial clk = 1'b0;
  always #2 clk = ~clk; // 250 MHz

  // -----------------------------
  // Test vectors
  // -----------------------------
  localparam [63:0] A_INIT = 64'h1122334455667788;
  localparam [63:0] B_INIT = 64'hF0F00F0FA5A55A5A;
  localparam [63:0] C_INIT = 64'h0000000000000009; // 避免除以零
  localparam [63:0] D_INIT = 64'h0123456789ABCDEF;

  // -----------------------------
  // Integer square-root helpers (Verilog-2001 版本)
  // -----------------------------
  function [7:0]  isqrt8;  input [7:0]  x; integer k; reg [7:0]  y; begin
    y = 0; for (k=7; k>=0; k=k-1)  if ((y+(1<<k))*(y+(1<<k)) <= x)  y = y + (1<<k);
    isqrt8 = y;
  end endfunction

  function [15:0] isqrt16; input [15:0] x; integer k; reg [15:0] y; begin
    y = 0; for (k=15; k>=0; k=k-1) if ((y+(1<<k))*(y+(1<<k)) <= x)  y = y + (1<<k);
    isqrt16 = y;
  end endfunction

  function [15:0] isqrt32; input [31:0] x; integer k; reg [15:0] y; begin
    y = 0; for (k=15; k>=0; k=k-1) if ((y+(1<<k))*(y+(1<<k)) <= x)  y = y + (1<<k);
    isqrt32 = y;
  end endfunction

  function [31:0] isqrt64; input [63:0] x; integer k; reg [31:0] y; begin
    y = 0; for (k=31; k>=0; k=k-1) if ((y+(1<<k))*(y+(1<<k)) <= x)  y = y + (1<<k);
    isqrt64 = y;
  end endfunction

  // -----------------------------
  // Golden model for ALU (依據 func/ww 分lane計算)
  // -----------------------------
  function [63:0] model_alu;
    input [5:0]  func;
    input [1:0]  ww;
    input [63:0] A, B;
    reg   [63:0] R;
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
          R[31:0]  = A[31:0]  + B[31:0];
          R[63:32] = A[63:32] + B[63:32];
        end
        else if (ww==2'b01) begin
          R[15:0]   = A[15:0]   + B[15:0];
          R[31:16]  = A[31:16]  + B[31:16];
          R[47:32]  = A[47:32]  + B[47:32];
          R[63:48]  = A[63:48]  + B[63:48];
        end
        else begin
          R[7:0]    = A[7:0]    + B[7:0];
          R[15:8]   = A[15:8]   + B[15:8];
          R[23:16]  = A[23:16]  + B[23:16];
          R[31:24]  = A[31:24]  + B[31:24];
          R[39:32]  = A[39:32]  + B[39:32];
          R[47:40]  = A[47:40]  + B[47:40];
          R[55:48]  = A[55:48]  + B[55:48];
          R[63:56]  = A[63:56]  + B[63:56];
        end
      end

      6'b000111: begin              // VSUB
        if (ww==2'b11) R = A - B;
        else if (ww==2'b10) begin
          R[31:0]  = A[31:0]  - B[31:0];
          R[63:32] = A[63:32] - B[63:32];
        end
        else if (ww==2'b01) begin
          R[15:0]   = A[15:0]   - B[15:0];
          R[31:16]  = A[31:16]  - B[31:16];
          R[47:32]  = A[47:32]  - B[47:32];
          R[63:48]  = A[63:48]  - B[63:48];
        end
        else begin
          R[7:0]    = A[7:0]    - B[7:0];
          R[15:8]   = A[15:8]   - B[15:8];
          R[23:16]  = A[23:16]  - B[23:16];
          R[31:24]  = A[31:24]  - B[31:24];
          R[39:32]  = A[39:32]  - B[39:32];
          R[47:40]  = A[47:40]  - B[47:40];
          R[55:48]  = A[55:48]  - B[55:48];
          R[63:56]  = A[63:56]  - B[63:56];
        end
      end

      6'b001000: begin              // VMULEU (even)
        R = 64'd0;
        if (ww==2'b10) R = { (A[31:0]*B[31:0]) , 32'd0 };
        else if (ww==2'b01) begin
          R[31:0]  = A[15:0]*B[15:0];
          R[63:32] = A[47:32]*B[47:32];
        end
        else if (ww==2'b00) begin
          R[15:0]  = A[7:0]  * B[7:0];
          R[31:16] = A[23:16]* B[23:16];
          R[47:32] = A[39:32]* B[39:32];
          R[63:48] = A[55:48]* B[55:48];
        end
      end

      6'b001001: begin              // VMULOU (odd)
        R = 64'd0;
        if (ww==2'b10) R = { (A[63:32]*B[63:32]) , 32'd0 };
        else if (ww==2'b01) begin
          R[31:0]  = A[31:16]*B[31:16];
          R[63:32] = A[63:48]*B[63:48];
        end
        else if (ww==2'b00) begin
          R[15:0]  = A[15:8] * B[15:8];
          R[31:16] = A[31:24]* B[31:24];
          R[47:32] = A[47:40]* B[47:40];
          R[63:48] = A[63:56]* B[63:56];
        end
      end

      6'b001010: begin              // VSLL
        if (ww==2'b11) R = A << B[63:58];
        else if (ww==2'b10) begin
          R[31:0]  = A[31:0]  << B[31:27];
          R[63:32] = A[63:32] << B[63:59];
        end
        else if (ww==2'b01) begin
          R[15:0]   = A[15:0]   << B[15:12];
          R[31:16]  = A[31:16]  << B[31:28];
          R[47:32]  = A[47:32]  << B[47:44];
          R[63:48]  = A[63:48]  << B[63:60];
        end
        else begin
          R[7:0]    = A[7:0]    << B[7:5];
          R[15:8]   = A[15:8]   << B[15:13];
          R[23:16]  = A[23:16]  << B[23:21];
          R[31:24]  = A[31:24]  << B[31:29];
          R[39:32]  = A[39:32]  << B[39:37];
          R[47:40]  = A[47:40]  << B[47:45];
          R[55:48]  = A[55:48]  << B[55:53];
          R[63:56]  = A[63:56]  << B[63:61];
        end
      end

      6'b001011: begin              // VSRL
        if (ww==2'b11) R = A >> B[63:58];
        else if (ww==2'b10) begin
          R[31:0]  = A[31:0]  >> B[31:27];
          R[63:32] = A[63:32] >> B[63:59];
        end
        else if (ww==2'b01) begin
          R[15:0]   = A[15:0]   >> B[15:12];
          R[31:16]  = A[31:16]  >> B[31:28];
          R[47:32]  = A[47:32]  >> B[47:44];
          R[63:48]  = A[63:48]  >> B[63:60];
        end
        else begin
          R[7:0]    = A[7:0]    >> B[7:5];
          R[15:8]   = A[15:8]   >> B[15:13];
          R[23:16]  = A[23:16]  >> B[23:21];
          R[31:24]  = A[31:24]  >> B[31:29];
          R[39:32]  = A[39:32]  >> B[39:37];
          R[47:40]  = A[47:40]  >> B[47:45];
          R[55:48]  = A[55:48]  >> B[55:53];
          R[63:56]  = A[63:56]  >> B[63:61];
        end
      end

      6'b001100: begin              // VSRA
        if (ww==2'b11) R = $signed(A) >>> B[63:58];
        else if (ww==2'b10) begin
          R[31:0]  = $signed(A[31:0])  >>> B[31:27];
          R[63:32] = $signed(A[63:32]) >>> B[63:59];
        end
        else if (ww==2'b01) begin
          R[15:0]   = $signed(A[15:0])   >>> B[15:12];
          R[31:16]  = $signed(A[31:16])  >>> B[31:28];
          R[47:32]  = $signed(A[47:32])  >>> B[47:44];
          R[63:48]  = $signed(A[63:48])  >>> B[63:60];
        end
        else begin
          R[7:0]    = $signed(A[7:0])    >>> B[7:5];
          R[15:8]   = $signed(A[15:8])   >>> B[15:13];
          R[23:16]  = $signed(A[23:16])  >>> B[23:21];
          R[31:24]  = $signed(A[31:24])  >>> B[31:29];
          R[39:32]  = $signed(A[39:32])  >>> B[39:37];
          R[47:40]  = $signed(A[47:40])  >>> B[47:45];
          R[55:48]  = $signed(A[55:48])  >>> B[55:53];
          R[63:56]  = $signed(A[63:56])  >>> B[63:61];
        end
      end

      6'b001101: begin              // VRTTH
        if (ww==2'b11)        R = {A[31:0],A[63:32]};
        else if (ww==2'b10)   begin R[31:0]={A[15:0],A[31:16]}; R[63:32]={A[47:32],A[63:48]}; end
        else if (ww==2'b01)   begin
          R[15:0]={A[7:0],A[15:8]};     R[31:16]={A[23:16],A[31:24]};
          R[47:32]={A[39:32],A[47:40]}; R[63:48]={A[55:48],A[63:56]};
        end
        else begin
          R[7:0] ={A[3:0],A[7:4]};   R[15:8] ={A[11:8],A[15:12]};
          R[23:16]={A[19:16],A[23:20]}; R[31:24]={A[27:24],A[31:28]};
          R[39:32]={A[35:32],A[39:36]}; R[47:40]={A[43:40],A[47:44]};
          R[55:48]={A[51:48],A[55:52]}; R[63:56]={A[59:56],A[63:60]};
        end
      end

      6'b001110: begin              // VDIV (unsigned)
        if (ww==2'b11) R = (B!=0) ? (A/B) : 64'd0;
        else if (ww==2'b10) begin
          R[31:0]  = (B[31:0]  != 0) ? (A[31:0]  / B[31:0])  : 32'd0;
          R[63:32] = (B[63:32] != 0) ? (A[63:32] / B[63:32]) : 32'd0;
        end
        else if (ww==2'b01) begin
          R[15:0]   = (B[15:0]   != 0) ? (A[15:0]   / B[15:0])   : 16'd0;
          R[31:16]  = (B[31:16]  != 0) ? (A[31:16]  / B[31:16])  : 16'd0;
          R[47:32]  = (B[47:32]  != 0) ? (A[47:32]  / B[47:32])  : 16'd0;
          R[63:48]  = (B[63:48]  != 0) ? (A[63:48]  / B[63:48])  : 16'd0;
        end
        else begin
          R[7:0]    = (B[7:0]    != 0) ? (A[7:0]    / B[7:0])    : 8'd0;
          R[15:8]   = (B[15:8]   != 0) ? (A[15:8]   / B[15:8])   : 8'd0;
          R[23:16]  = (B[23:16]  != 0) ? (A[23:16]  / B[23:16])  : 8'd0;
          R[31:24]  = (B[31:24]  != 0) ? (A[31:24]  / B[31:24])  : 8'd0;
          R[39:32]  = (B[39:32]  != 0) ? (A[39:32]  / B[39:32])  : 8'd0;
          R[47:40]  = (B[47:40]  != 0) ? (A[47:40]  / B[47:40])  : 8'd0;
          R[55:48]  = (B[55:48]  != 0) ? (A[55:48]  / B[55:48])  : 8'd0;
          R[63:56]  = (B[63:56]  != 0) ? (A[63:56]  / B[63:56])  : 8'd0;
        end
      end

      6'b001111: begin              // VMOD (unsigned)
        if (ww==2'b11) R = (B!=0) ? (A%B) : 64'd0;
        else if (ww==2'b10) begin
          R[31:0]  = (B[31:0]  != 0) ? (A[31:0]  % B[31:0])  : 32'd0;
          R[63:32] = (B[63:32] != 0) ? (A[63:32] % B[63:32]) : 32'd0;
        end
        else if (ww==2'b01) begin
          R[15:0]   = (B[15:0]   != 0) ? (A[15:0]   % B[15:0])   : 16'd0;
          R[31:16]  = (B[31:16]  != 0) ? (A[31:16]  % B[31:16])  : 16'd0;
          R[47:32]  = (B[47:32]  != 0) ? (A[47:32]  % B[47:32])  : 16'd0;
          R[63:48]  = (B[63:48]  != 0) ? (A[63:48]  % B[63:48])  : 16'd0;
        end
        else begin
          R[7:0]    = (B[7:0]    != 0) ? (A[7:0]    % B[7:0])    : 8'd0;
          R[15:8]   = (B[15:8]   != 0) ? (A[15:8]   % B[15:8])   : 8'd0;
          R[23:16]  = (B[23:16]  != 0) ? (A[23:16]  % B[23:16])  : 8'd0;
          R[31:24]  = (B[31:24]  != 0) ? (A[31:24]  % B[31:24])  : 8'd0;
          R[39:32]  = (B[39:32]  != 0) ? (A[39:32]  % B[39:32])  : 8'd0;
          R[47:40]  = (B[47:40]  != 0) ? (A[47:40]  % B[47:40])  : 8'd0;
          R[55:48]  = (B[55:48]  != 0) ? (A[55:48]  % B[55:48])  : 8'd0;
          R[63:56]  = (B[63:56]  != 0) ? (A[63:56]  % B[63:56])  : 8'd0;
        end
      end

      6'b010000: begin              // VSQEU (even)
        R = 64'd0;
        if (ww==2'b10) R = { (A[31:0]*A[31:0]), 32'd0 };
        else if (ww==2'b01) begin
          R[31:0]  = A[15:0]*A[15:0];
          R[63:32] = A[47:32]*A[47:32];
        end
        else if (ww==2'b00) begin
          R[15:0]  = A[7:0]*A[7:0];
          R[31:16] = A[23:16]*A[23:16];
          R[47:32] = A[39:32]*A[39:32];
          R[63:48] = A[55:48]*A[55:48];
        end
      end

      6'b010001: begin              // VSQOU (odd)
        R = 64'd0;
        if (ww==2'b10) R = { (A[63:32]*A[63:32]), 32'd0 };
        else if (ww==2'b01) begin
          R[31:0]  = A[31:16]*A[31:16];
          R[63:32] = A[63:48]*A[63:48];
        end
        else if (ww==2'b00) begin
          R[15:0]  = A[15:8]*A[15:8];
          R[31:16] = A[31:24]*A[31:24];
          R[47:32] = A[47:40]*A[47:40];
          R[63:48] = A[63:56]*A[63:56];
        end
      end

      6'b010010: begin              // VSQRT (zero-pad)
        if (ww==2'b11)         R = {32'd0, isqrt64(A)};
        else if (ww==2'b10)    begin R[31:0]={16'd0,isqrt32(A[31:0])};   R[63:32]={16'd0,isqrt32(A[63:32])}; end
        else if (ww==2'b01)    begin
          R[15:0] ={8'd0,isqrt16(A[15:0])};   R[31:16]={8'd0,isqrt16(A[31:16])};
          R[47:32]={8'd0,isqrt16(A[47:32])};  R[63:48]={8'd0,isqrt16(A[63:48])};
        end
        else begin
          R[7:0]  ={4'd0,isqrt8(A[7:0])};    R[15:8] ={4'd0,isqrt8(A[15:8])};
          R[23:16]={4'd0,isqrt8(A[23:16])};  R[31:24]={4'd0,isqrt8(A[31:24])};
          R[39:32]={4'd0,isqrt8(A[39:32])};  R[47:40]={4'd0,isqrt8(A[47:40])};
          R[55:48]={4'd0,isqrt8(A[55:48])};  R[63:56]={4'd0,isqrt8(A[63:56])};
        end
      end

      default: R = 64'd0;
    endcase
    model_alu = R;
  end
  endfunction

  // -----------------------------
  // 驅動/比對：force 進 EX 階段匯流排，取 ALU 與 WB
  // 注意：以下位元欄位位置需依你的設計確認！
  //  - [0:5]   opcode (ALU = 6'b101010)
  //  - [24:25] ww
  //  - [26:31] func
  //  - [32:95]  dataA
  //  - [96:159] dataB
  // -----------------------------
  task drive_and_check;
    input [5:0]  func;
    input [1:0]  ww;
    input [63:0] A;
    input [63:0] B;
    input [127:0] tag; // 文字標籤用bytes
    reg   [0:159] v;
    reg   [63:0] exp, got1, got2;
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

    #1; // 組合穩定
    got1 = dut.ALU_data_out;

    @(posedge clk);
    #1;
    // <<< 若你的 WB 匯流排資料欄位非 [9:72]，請改這裡 >>>
    got2 = dut.stage3_EXMEM_WB_out[9:72];

    release dut.stage2_ID_EXMEM_out;

    fail = 0;
    if (got1 !== exp) begin
      $display("[FAIL-COMB] func=%0d ww=%0d tag=%0s A=%h B=%h exp=%h got=%h (ALU_data_out)",
               func, ww, tag, A, B, exp, got1);
      fail = 1;
    end
    if (got2 !== exp) begin
      $display("[FAIL-WB]   func=%0d ww=%0d tag=%0s A=%h B=%h exp=%h got=%h (stage3 data)",
               func, ww, tag, A, B, exp, got2);
      fail = 1;
    end
    if (!fail) $display("[PASS] func=%0d ww=%0d tag=%0s -> %h", func, ww, tag, exp);
    if (fail)  begin $display("** TEST FAILED **"); $finish; end
  end
  endtask

  // -----------------------------
  // Test plan: cover ALL function codes
  // -----------------------------
  initial begin
    reset = 1'b1;
    Instr_from_imem = 32'd0;
    data_from_dmem  = 64'd0;
    dout_from_nic   = 64'd0;

    repeat (5) @(posedge clk);
    reset = 1'b0;

    // 基本位元運算
    drive_and_check(6'b000001, 2'b11, A_INIT, B_INIT, "VAND 64");
    drive_and_check(6'b000010, 2'b11, A_INIT, B_INIT, "VOR 64");
    drive_and_check(6'b000011, 2'b11, A_INIT, B_INIT, "VXOR 64");
    drive_and_check(6'b000100, 2'b11, A_INIT, 64'd0 , "VNOT 64");
    drive_and_check(6'b000101, 2'b11, A_INIT, 64'd0 , "VMOV 64");

    // 加減（多種 ww）
    drive_and_check(6'b000110, 2'b10, A_INIT, B_INIT, "VADD 32x2");
    drive_and_check(6'b000110, 2'b01, A_INIT, B_INIT, "VADD 16x4");
    drive_and_check(6'b000110, 2'b00, A_INIT, B_INIT, "VADD 8x8");
    drive_and_check(6'b000111, 2'b10, A_INIT, B_INIT, "VSUB 32x2");
    drive_and_check(6'b000111, 2'b01, A_INIT, B_INIT, "VSUB 16x4");
    drive_and_check(6'b000111, 2'b00, A_INIT, B_INIT, "VSUB 8x8");

    // 乘法（even/odd）
    drive_and_check(6'b001000, 2'b00, A_INIT, B_INIT, "VMULEU 8x8");
    drive_and_check(6'b001000, 2'b01, A_INIT, B_INIT, "VMULEU 16x4");
    drive_and_check(6'b001000, 2'b10, A_INIT, B_INIT, "VMULEU 32x2");
    drive_and_check(6'b001001, 2'b00, A_INIT, B_INIT, "VMULOU 8x8");
    drive_and_check(6'b001001, 2'b01, A_INIT, B_INIT, "VMULOU 16x4");
    drive_and_check(6'b001001, 2'b10, A_INIT, B_INIT, "VMULOU 32x2");

    // 位移與旋轉
    drive_and_check(6'b001010, 2'b11, A_INIT, C_INIT, "VSLL 64");
    drive_and_check(6'b001011, 2'b10, A_INIT, C_INIT, "VSRL 32x2");
    drive_and_check(6'b001100, 2'b01, A_INIT, C_INIT, "VSRA 16x4");
    drive_and_check(6'b001101, 2'b00, A_INIT, 64'd0 , "VRTTH 8x8");

    // 除與餘（避免除以0）
    drive_and_check(6'b001110, 2'b11, D_INIT, C_INIT, "VDIV 64");
    drive_and_check(6'b001110, 2'b10, D_INIT, {C_INIT[31:0], C_INIT[31:0]}, "VDIV 32x2");
    drive_and_check(6'b001111, 2'b01, D_INIT, {4{C_INIT[15:0]}}, "VMOD 16x4");

    // 平方（even/odd）
    drive_and_check(6'b010000, 2'b10, D_INIT, 64'd0, "VSQEU 32x2");
    drive_and_check(6'b010000, 2'b01, D_INIT, 64'd0, "VSQEU 16x4");
    drive_and_check(6'b010000, 2'b00, D_INIT, 64'd0, "VSQEU 8x8");

    drive_and_check(6'b010001, 2'b10, D_INIT, 64'd0, "VSQOU 32x2");
    drive_and_check(6'b010001, 2'b01, D_INIT, 64'd0, "VSQOU 16x4");
    drive_and_check(6'b010001, 2'b00, D_INIT, 64'd0, "VSQOU 8x8");

    // 開根號
    drive_and_check(6'b010010, 2'b11, C_INIT, 64'd0, "VSQRT 64");
    drive_and_check(6'b010010, 2'b10, {C_INIT[31:0],C_INIT[31:0]}, 64'd0, "VSQRT 32x2");
    drive_and_check(6'b010010, 2'b01, {4{C_INIT[15:0]}}, 64'd0, "VSQRT 16x4");
    drive_and_check(6'b010010, 2'b00, {8{C_INIT[7:0]}}, 64'd0, "VSQRT 8x8");

    $display("=== ALL ALU FUNCTION CODES EXERCISED ===");
    $finish;
  end

endmodule
