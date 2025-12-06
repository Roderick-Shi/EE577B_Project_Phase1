//==============================================================
// 4x4 cardinal_mesh
// Each nodeXY has:
//   nodeXY_pesi   : input  (NIC -> router valid)
//   nodeXY_peri   : output (router -> NIC ready)
//   nodeXY_pedi   : input  [63:0] (NIC -> router data)
//   nodeXY_peso   : output (router -> NIC valid)
//   nodeXY_pero   : input  (NIC -> router ready)
//   nodeXY_pedo   : output [63:0] (router -> NIC data)
//   nodeXY_polarity : output (router -> NIC polarity)
//==============================================================
module cardinal_mesh(
  input  clk,
  input  reset,

  // node00
  input         node00_pesi, node00_pero,
  input  [63:0] node00_pedi,
  output        node00_peri, node00_peso,
  output [63:0] node00_pedo,
  output        node00_polarity,

  // node01
  input         node01_pesi, node01_pero,
  input  [63:0] node01_pedi,
  output        node01_peri, node01_peso,
  output [63:0] node01_pedo,
  output        node01_polarity,

  // node02
  input         node02_pesi, node02_pero,
  input  [63:0] node02_pedi,
  output        node02_peri, node02_peso,
  output [63:0] node02_pedo,
  output        node02_polarity,

  // node03
  input         node03_pesi, node03_pero,
  input  [63:0] node03_pedi,
  output        node03_peri, node03_peso,
  output [63:0] node03_pedo,
  output        node03_polarity,

  // node10
  input         node10_pesi, node10_pero,
  input  [63:0] node10_pedi,
  output        node10_peri, node10_peso,
  output [63:0] node10_pedo,
  output        node10_polarity,

  // node11
  input         node11_pesi, node11_pero,
  input  [63:0] node11_pedi,
  output        node11_peri, node11_peso,
  output [63:0] node11_pedo,
  output        node11_polarity,

  // node12
  input         node12_pesi, node12_pero,
  input  [63:0] node12_pedi,
  output        node12_peri, node12_peso,
  output [63:0] node12_pedo,
  output        node12_polarity,

  // node13
  input         node13_pesi, node13_pero,
  input  [63:0] node13_pedi,
  output        node13_peri, node13_peso,
  output [63:0] node13_pedo,
  output        node13_polarity,

  // node20
  input         node20_pesi, node20_pero,
  input  [63:0] node20_pedi,
  output        node20_peri, node20_peso,
  output [63:0] node20_pedo,
  output        node20_polarity,

  // node21
  input         node21_pesi, node21_pero,
  input  [63:0] node21_pedi,
  output        node21_peri, node21_peso,
  output [63:0] node21_pedo,
  output        node21_polarity,

  // node22
  input         node22_pesi, node22_pero,
  input  [63:0] node22_pedi,
  output        node22_peri, node22_peso,
  output [63:0] node22_pedo,
  output        node22_polarity,

  // node23
  input         node23_pesi, node23_pero,
  input  [63:0] node23_pedi,
  output        node23_peri, node23_peso,
  output [63:0] node23_pedo,
  output        node23_polarity,

  // node30
  input         node30_pesi, node30_pero,
  input  [63:0] node30_pedi,
  output        node30_peri, node30_peso,
  output [63:0] node30_pedo,
  output        node30_polarity,

  // node31
  input         node31_pesi, node31_pero,
  input  [63:0] node31_pedi,
  output        node31_peri, node31_peso,
  output [63:0] node31_pedo,
  output        node31_polarity,

  // node32
  input         node32_pesi, node32_pero,
  input  [63:0] node32_pedi,
  output        node32_peri, node32_peso,
  output [63:0] node32_pedo,
  output        node32_polarity,

  // node33
  input         node33_pesi, node33_pero,
  input  [63:0] node33_pedi,
  output        node33_peri, node33_peso,
  output [63:0] node33_pedo,
  output        node33_polarity
);

  // ==========================================================
  // Internal mesh wiring
  // ==========================================================

  // Router link signals
  wire        up_si   [0:15], down_si [0:15], left_si [0:15], right_si[0:15];
  wire        up_ri   [0:15], down_ri [0:15], left_ri [0:15], right_ri[0:15];
  wire        up_so   [0:15], down_so [0:15], left_so [0:15], right_so[0:15];
  wire        up_ro   [0:15], down_ro [0:15], left_ro [0:15], right_ro[0:15];
  wire [63:0] up_di   [0:15], down_di [0:15], left_di [0:15], right_di[0:15];
  wire [63:0] up_do   [0:15], down_do [0:15], left_do [0:15], right_do[0:15];

  // Local NIC side (per node)
  wire        nic_si  [0:15];
  wire [63:0] nic_di  [0:15];
  wire        nic_ri  [0:15];
  wire        nic_so  [0:15];
  wire [63:0] nic_do  [0:15];
  wire        nic_ro  [0:15];

  // Router polarity outputs
  wire        rpol    [0:15];

  // ----------------------------------------------------------
  // Flattened node indices (x + 4*y)
  // y = 0: nodes 00,10,20,30
  localparam integer N00 = 0,  N10 = 1,  N20 = 2,  N30 = 3;
  // y = 1: nodes 01,11,21,31
  localparam integer N01 = 4,  N11 = 5,  N21 = 6,  N31 = 7;
  // y = 2: nodes 02,12,22,32
  localparam integer N02 = 8,  N12 = 9,  N22 = 10, N32 = 11;
  // y = 3: nodes 03,13,23,33
  localparam integer N03 = 12, N13 = 13, N23 = 14, N33 = 15;

  // ----------------------------------------------------------
  // Map nodeXY_* ports <-> internal nic_* arrays
  // ----------------------------------------------------------

  // y = 0 row: nodes 00,10,20,30
  assign nic_si[N00] = node00_pesi;
  assign nic_di[N00] = node00_pedi;
  assign node00_peri = nic_ri[N00];
  assign node00_peso = nic_so[N00];
  assign node00_pedo = nic_do[N00];
  assign nic_ro[N00] = node00_pero;
  assign node00_polarity = rpol[N00];

  assign nic_si[N10] = node10_pesi;
  assign nic_di[N10] = node10_pedi;
  assign node10_peri = nic_ri[N10];
  assign node10_peso = nic_so[N10];
  assign node10_pedo = nic_do[N10];
  assign nic_ro[N10] = node10_pero;
  assign node10_polarity = rpol[N10];

  assign nic_si[N20] = node20_pesi;
  assign nic_di[N20] = node20_pedi;
  assign node20_peri = nic_ri[N20];
  assign node20_peso = nic_so[N20];
  assign node20_pedo = nic_do[N20];
  assign nic_ro[N20] = node20_pero;
  assign node20_polarity = rpol[N20];

  assign nic_si[N30] = node30_pesi;
  assign nic_di[N30] = node30_pedi;
  assign node30_peri = nic_ri[N30];
  assign node30_peso = nic_so[N30];
  assign node30_pedo = nic_do[N30];
  assign nic_ro[N30] = node30_pero;
  assign node30_polarity = rpol[N30];

  // y = 1 row: nodes 01,11,21,31
  assign nic_si[N01] = node01_pesi;
  assign nic_di[N01] = node01_pedi;
  assign node01_peri = nic_ri[N01];
  assign node01_peso = nic_so[N01];
  assign node01_pedo = nic_do[N01];
  assign nic_ro[N01] = node01_pero;
  assign node01_polarity = rpol[N01];

  assign nic_si[N11] = node11_pesi;
  assign nic_di[N11] = node11_pedi;
  assign node11_peri = nic_ri[N11];
  assign node11_peso = nic_so[N11];
  assign node11_pedo = nic_do[N11];
  assign nic_ro[N11] = node11_pero;
  assign node11_polarity = rpol[N11];

  assign nic_si[N21] = node21_pesi;
  assign nic_di[N21] = node21_pedi;
  assign node21_peri = nic_ri[N21];
  assign node21_peso = nic_so[N21];
  assign node21_pedo = nic_do[N21];
  assign nic_ro[N21] = node21_pero;
  assign node21_polarity = rpol[N21];

  assign nic_si[N31] = node31_pesi;
  assign nic_di[N31] = node31_pedi;
  assign node31_peri = nic_ri[N31];
  assign node31_peso = nic_so[N31];
  assign node31_pedo = nic_do[N31];
  assign nic_ro[N31] = node31_pero;
  assign node31_polarity = rpol[N31];

  // y = 2 row: nodes 02,12,22,32
  assign nic_si[N02] = node02_pesi;
  assign nic_di[N02] = node02_pedi;
  assign node02_peri = nic_ri[N02];
  assign node02_peso = nic_so[N02];
  assign node02_pedo = nic_do[N02];
  assign nic_ro[N02] = node02_pero;
  assign node02_polarity = rpol[N02];

  assign nic_si[N12] = node12_pesi;
  assign nic_di[N12] = node12_pedi;
  assign node12_peri = nic_ri[N12];
  assign node12_peso = nic_so[N12];
  assign node12_pedo = nic_do[N12];
  assign nic_ro[N12] = node12_pero;
  assign node12_polarity = rpol[N12];

  assign nic_si[N22] = node22_pesi;
  assign nic_di[N22] = node22_pedi;
  assign node22_peri = nic_ri[N22];
  assign node22_peso = nic_so[N22];
  assign node22_pedo = nic_do[N22];
  assign nic_ro[N22] = node22_pero;
  assign node22_polarity = rpol[N22];

  assign nic_si[N32] = node32_pesi;
  assign nic_di[N32] = node32_pedi;
  assign node32_peri = nic_ri[N32];
  assign node32_peso = nic_so[N32];
  assign node32_pedo = nic_do[N32];
  assign nic_ro[N32] = node32_pero;
  assign node32_polarity = rpol[N32];

  // y = 3 row: nodes 03,13,23,33
  assign nic_si[N03] = node03_pesi;
  assign nic_di[N03] = node03_pedi;
  assign node03_peri = nic_ri[N03];
  assign node03_peso = nic_so[N03];
  assign node03_pedo = nic_do[N03];
  assign nic_ro[N03] = node03_pero;
  assign node03_polarity = rpol[N03];

  assign nic_si[N13] = node13_pesi;
  assign nic_di[N13] = node13_pedi;
  assign node13_peri = nic_ri[N13];
  assign node13_peso = nic_so[N13];
  assign node13_pedo = nic_do[N13];
  assign nic_ro[N13] = node13_pero;
  assign node13_polarity = rpol[N13];

  assign nic_si[N23] = node23_pesi;
  assign nic_di[N23] = node23_pedi;
  assign node23_peri = nic_ri[N23];
  assign node23_peso = nic_so[N23];
  assign node23_pedo = nic_do[N23];
  assign nic_ro[N23] = node23_pero;
  assign node23_polarity = rpol[N23];

  assign nic_si[N33] = node33_pesi;
  assign nic_di[N33] = node33_pedi;
  assign node33_peri = nic_ri[N33];
  assign node33_peso = nic_so[N33];
  assign node33_pedo = nic_do[N33];
  assign nic_ro[N33] = node33_pero;
  assign node33_polarity = rpol[N33];

  // ----------------------------------------------------------
  // Generate the 4x4 mesh of cardinal_router instances
  // ----------------------------------------------------------
  genvar x, y;
  generate
    for (y = 0; y < 4; y = y + 1) begin : GY
      for (x = 0; x < 4; x = x + 1) begin : GX
        localparam integer i = x + 4*y;

        // Up: +Y if exists
        assign up_si[i] = (y < 3) ? down_so[i+4] : 1'b0;
        assign up_di[i] = (y < 3) ? down_do[i+4] : 64'd0;
        assign up_ro[i] = (y < 3) ? down_ri[i+4] : 1'b0;

        // Down: -Y if exists
        assign down_si[i] = (y > 0) ? up_so[i-4] : 1'b0;
        assign down_di[i] = (y > 0) ? up_do[i-4] : 64'd0;
        assign down_ro[i] = (y > 0) ? up_ri[i-4] : 1'b0;

        // Right: +X if exists
        assign right_si[i] = (x < 3) ? left_so[i+1] : 1'b0;
        assign right_di[i] = (x < 3) ? left_do[i+1] : 64'd0;
        assign right_ro[i] = (x < 3) ? left_ri[i+1] : 1'b0;

        // Left: -X if exists
        assign left_si[i] = (x > 0) ? right_so[i-1] : 1'b0;
        assign left_di[i] = (x > 0) ? right_do[i-1] : 64'd0;
        assign left_ro[i] = (x > 0) ? right_ri[i-1] : 1'b0;

        cardinal_router R (
          .clk(clk), .reset(reset),

          .up_si(up_si[i]),     .down_si(down_si[i]),
          .left_si(left_si[i]), .right_si(right_si[i]),
          .NIC_si(nic_si[i]),

          .up_di(up_di[i]),     .down_di(down_di[i]),
          .left_di(left_di[i]), .right_di(right_di[i]),
          .NIC_di(nic_di[i]),

          .up_ri(up_ri[i]),     .down_ri(down_ri[i]),
          .left_ri(left_ri[i]), .right_ri(right_ri[i]),
          .NIC_ri(nic_ri[i]),

          .up_so(up_so[i]),     .down_so(down_so[i]),
          .left_so(left_so[i]), .right_so(right_so[i]),
          .NIC_so(nic_so[i]),

          .up_do(up_do[i]),     .down_do(down_do[i]),
          .left_do(left_do[i]), .right_do(right_do[i]),
          .NIC_do(nic_do[i]),

          .up_ro(up_ro[i]),     .down_ro(down_ro[i]),
          .left_ro(left_ro[i]), .right_ro(right_ro[i]),
          .NIC_ro(nic_ro[i]),

          .polarity_to_NIC(rpol[i])
        );
      end
    end
  endgenerate

endmodule
