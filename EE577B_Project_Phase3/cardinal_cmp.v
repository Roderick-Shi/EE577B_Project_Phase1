module cardinal_cmp (
    input  clk,
    input  reset,
    output polarity,

    // node 0
    input  [0:31] node0_inst_in,
    input  [0:63] node0_d_in,
    output [0:31] node0_pc_out,
    output [0:63] node0_d_out,
    output [0:31] node0_addr_out,
    output        node0_memWrEn,
    output        node0_memEn,

    // node 1
    input  [0:31] node1_inst_in,
    input  [0:63] node1_d_in,
    output [0:31] node1_pc_out,
    output [0:63] node1_d_out,
    output [0:31] node1_addr_out,
    output        node1_memWrEn,
    output        node1_memEn,

    // node 2
    input  [0:31] node2_inst_in,
    input  [0:63] node2_d_in,
    output [0:31] node2_pc_out,
    output [0:63] node2_d_out,
    output [0:31] node2_addr_out,
    output        node2_memWrEn,
    output        node2_memEn,

    // node 3
    input  [0:31] node3_inst_in,
    input  [0:63] node3_d_in,
    output [0:31] node3_pc_out,
    output [0:63] node3_d_out,
    output [0:31] node3_addr_out,
    output        node3_memWrEn,
    output        node3_memEn,

    // node 4
    input  [0:31] node4_inst_in,
    input  [0:63] node4_d_in,
    output [0:31] node4_pc_out,
    output [0:63] node4_d_out,
    output [0:31] node4_addr_out,
    output        node4_memWrEn,
    output        node4_memEn,

    // node 5
    input  [0:31] node5_inst_in,
    input  [0:63] node5_d_in,
    output [0:31] node5_pc_out,
    output [0:63] node5_d_out,
    output [0:31] node5_addr_out,
    output        node5_memWrEn,
    output        node5_memEn,

    // node 6
    input  [0:31] node6_inst_in,
    input  [0:63] node6_d_in,
    output [0:31] node6_pc_out,
    output [0:63] node6_d_out,
    output [0:31] node6_addr_out,
    output        node6_memWrEn,
    output        node6_memEn,

    // node 7
    input  [0:31] node7_inst_in,
    input  [0:63] node7_d_in,
    output [0:31] node7_pc_out,
    output [0:63] node7_d_out,
    output [0:31] node7_addr_out,
    output        node7_memWrEn,
    output        node7_memEn,

    // node 8
    input  [0:31] node8_inst_in,
    input  [0:63] node8_d_in,
    output [0:31] node8_pc_out,
    output [0:63] node8_d_out,
    output [0:31] node8_addr_out,
    output        node8_memWrEn,
    output        node8_memEn,

    // node 9
    input  [0:31] node9_inst_in,
    input  [0:63] node9_d_in,
    output [0:31] node9_pc_out,
    output [0:63] node9_d_out,
    output [0:31] node9_addr_out,
    output        node9_memWrEn,
    output        node9_memEn,

    // node 10
    input  [0:31] node10_inst_in,
    input  [0:63] node10_d_in,
    output [0:31] node10_pc_out,
    output [0:63] node10_d_out,
    output [0:31] node10_addr_out,
    output        node10_memWrEn,
    output        node10_memEn,

    // node 11
    input  [0:31] node11_inst_in,
    input  [0:63] node11_d_in,
    output [0:31] node11_pc_out,
    output [0:63] node11_d_out,
    output [0:31] node11_addr_out,
    output        node11_memWrEn,
    output        node11_memEn,

    // node 12
    input  [0:31] node12_inst_in,
    input  [0:63] node12_d_in,
    output [0:31] node12_pc_out,
    output [0:63] node12_d_out,
    output [0:31] node12_addr_out,
    output        node12_memWrEn,
    output        node12_memEn,

    // node 13
    input  [0:31] node13_inst_in,
    input  [0:63] node13_d_in,
    output [0:31] node13_pc_out,
    output [0:63] node13_d_out,
    output [0:31] node13_addr_out,
    output        node13_memWrEn,
    output        node13_memEn,

    // node 14
    input  [0:31] node14_inst_in,
    input  [0:63] node14_d_in,
    output [0:31] node14_pc_out,
    output [0:63] node14_d_out,
    output [0:31] node14_addr_out,
    output        node14_memWrEn,
    output        node14_memEn,

    // node 15
    input  [0:31] node15_inst_in,
    input  [0:63] node15_d_in,
    output [0:31] node15_pc_out,
    output [0:63] node15_d_out,
    output [0:31] node15_addr_out,
    output        node15_memWrEn,
    output        node15_memEn
);


    // ========= Mesh <-> NIC wires =========

    // row y = 0
    // node (0,0) ↔ CMP node0
    wire        node00_pesi, node00_pero, node00_peri, node00_peso;
    wire [63:0] node00_pedi, node00_pedo;

    // node (1,0) ↔ CMP node1
    wire        node10_pesi, node10_pero, node10_peri, node10_peso;
    wire [63:0] node10_pedi, node10_pedo;

    // node (2,0) ↔ CMP node2
    wire        node20_pesi, node20_pero, node20_peri, node20_peso;
    wire [63:0] node20_pedi, node20_pedo;

    // node (3,0) ↔ CMP node3
    wire        node30_pesi, node30_pero, node30_peri, node30_peso;
    wire [63:0] node30_pedi, node30_pedo;

    // row y = 1
    // node (0,1) ↔ CMP node4
    wire        node01_pesi, node01_pero, node01_peri, node01_peso;
    wire [63:0] node01_pedi, node01_pedo;

    // node (1,1) ↔ CMP node5
    wire        node11_pesi, node11_pero, node11_peri, node11_peso;
    wire [63:0] node11_pedi, node11_pedo;

    // node (2,1) ↔ CMP node6
    wire        node21_pesi, node21_pero, node21_peri, node21_peso;
    wire [63:0] node21_pedi, node21_pedo;

    // node (3,1) ↔ CMP node7
    wire        node31_pesi, node31_pero, node31_peri, node31_peso;
    wire [63:0] node31_pedi, node31_pedo;

    // row y = 2
    // node (0,2) ↔ CMP node8
    wire        node02_pesi, node02_pero, node02_peri, node02_peso;
    wire [63:0] node02_pedi, node02_pedo;

    // node (1,2) ↔ CMP node9
    wire        node12_pesi, node12_pero, node12_peri, node12_peso;
    wire [63:0] node12_pedi, node12_pedo;

    // node (2,2) ↔ CMP node10
    wire        node22_pesi, node22_pero, node22_peri, node22_peso;
    wire [63:0] node22_pedi, node22_pedo;

    // node (3,2) ↔ CMP node11
    wire        node32_pesi, node32_pero, node32_peri, node32_peso;
    wire [63:0] node32_pedi, node32_pedo;

    // row y = 3
    // node (0,3) ↔ CMP node12
    wire        node03_pesi, node03_pero, node03_peri, node03_peso;
    wire [63:0] node03_pedi, node03_pedo;

    // node (1,3) ↔ CMP node13
    wire        node13_pesi, node13_pero, node13_peri, node13_peso;
    wire [63:0] node13_pedi, node13_pedo;

    // node (2,3) ↔ CMP node14
    wire        node23_pesi, node23_pero, node23_peri, node23_peso;
    wire [63:0] node23_pedi, node23_pedo;

    // node (3,3) ↔ CMP node15
    wire        node33_pesi, node33_pero, node33_peri, node33_peso;
    wire [63:0] node33_pedi, node33_pedo;


    

    // ========= CPU <-> NIC wires =========

    // Node 0
    wire [1:0]  nic0_addr;
    wire [63:0] nic0_din,  nic0_dout;
    wire        nic0_en,   nic0_wrEn;

    // Node 1
    wire [1:0]  nic1_addr;
    wire [63:0] nic1_din,  nic1_dout;
    wire        nic1_en,   nic1_wrEn;

    // Node 2
    wire [1:0]  nic2_addr;
    wire [63:0] nic2_din,  nic2_dout;
    wire        nic2_en,   nic2_wrEn;

    // Node 3
    wire [1:0]  nic3_addr;
    wire [63:0] nic3_din,  nic3_dout;
    wire        nic3_en,   nic3_wrEn;

    // Node 4
    wire [1:0]  nic4_addr;
    wire [63:0] nic4_din,  nic4_dout;
    wire        nic4_en,   nic4_wrEn;

    // Node 5
    wire [1:0]  nic5_addr;
    wire [63:0] nic5_din,  nic5_dout;
    wire        nic5_en,   nic5_wrEn;

    // Node 6
    wire [1:0]  nic6_addr;
    wire [63:0] nic6_din,  nic6_dout;
    wire        nic6_en,   nic6_wrEn;

    // Node 7
    wire [1:0]  nic7_addr;
    wire [63:0] nic7_din,  nic7_dout;
    wire        nic7_en,   nic7_wrEn;

    // Node 8
    wire [1:0]  nic8_addr;
    wire [63:0] nic8_din,  nic8_dout;
    wire        nic8_en,   nic8_wrEn;

    // Node 9
    wire [1:0]  nic9_addr;
    wire [63:0] nic9_din,  nic9_dout;
    wire        nic9_en,   nic9_wrEn;

    // Node 10
    wire [1:0]  nic10_addr;
    wire [63:0] nic10_din,  nic10_dout;
    wire        nic10_en,   nic10_wrEn;

    // Node 11
    wire [1:0]  nic11_addr;
    wire [63:0] nic11_din,  nic11_dout;
    wire        nic11_en,   nic11_wrEn;

    // Node 12
    wire [1:0]  nic12_addr;
    wire [63:0] nic12_din,  nic12_dout;
    wire        nic12_en,   nic12_wrEn;

    // Node 13
    wire [1:0]  nic13_addr;
    wire [63:0] nic13_din,  nic13_dout;
    wire        nic13_en,   nic13_wrEn;

    // Node 14
    wire [1:0]  nic14_addr;
    wire [63:0] nic14_din,  nic14_dout;
    wire        nic14_en,   nic14_wrEn;

    // Node 15
    wire [1:0]  nic15_addr;
    wire [63:0] nic15_din,  nic15_dout;
    wire        nic15_en,   nic15_wrEn;


    // ========= Mesh instance =========
    cardinal_mesh MESH (
        .clk      (clk),
        .reset    (reset),
        .polarity (polarity),

        // ---------------- row y = 0 ----------------
        // node (0,0) ↔ CMP node0
        .node00_pesi (node00_pesi),
        .node00_pero (node00_pero),
        .node00_pedi (node00_pedi),
        .node00_peri (node00_peri),
        .node00_peso (node00_peso),
        .node00_pedo (node00_pedo),

        // node (1,0) ↔ CMP node1
        .node10_pesi (node10_pesi),
        .node10_pero (node10_pero),
        .node10_pedi (node10_pedi),
        .node10_peri (node10_peri),
        .node10_peso (node10_peso),
        .node10_pedo (node10_pedo),

        // node (2,0) ↔ CMP node2
        .node20_pesi (node20_pesi),
        .node20_pero (node20_pero),
        .node20_pedi (node20_pedi),
        .node20_peri (node20_peri),
        .node20_peso (node20_peso),
        .node20_pedo (node20_pedo),

        // node (3,0) ↔ CMP node3
        .node30_pesi (node30_pesi),
        .node30_pero (node30_pero),
        .node30_pedi (node30_pedi),
        .node30_peri (node30_peri),
        .node30_peso (node30_peso),
        .node30_pedo (node30_pedo),

        // ---------------- row y = 1 ----------------
        // node (0,1) ↔ CMP node4
        .node01_pesi (node01_pesi),
        .node01_pero (node01_pero),
        .node01_pedi (node01_pedi),
        .node01_peri (node01_peri),
        .node01_peso (node01_peso),
        .node01_pedo (node01_pedo),

        // node (1,1) ↔ CMP node5
        .node11_pesi (node11_pesi),
        .node11_pero (node11_pero),
        .node11_pedi (node11_pedi),
        .node11_peri (node11_peri),
        .node11_peso (node11_peso),
        .node11_pedo (node11_pedo),

        // node (2,1) ↔ CMP node6
        .node21_pesi (node21_pesi),
        .node21_pero (node21_pero),
        .node21_pedi (node21_pedi),
        .node21_peri (node21_peri),
        .node21_peso (node21_peso),
        .node21_pedo (node21_pedo),

        // node (3,1) ↔ CMP node7
        .node31_pesi (node31_pesi),
        .node31_pero (node31_pero),
        .node31_pedi (node31_pedi),
        .node31_peri (node31_peri),
        .node31_peso (node31_peso),
        .node31_pedo (node31_pedo),

        // ---------------- row y = 2 ----------------
        // node (0,2) ↔ CMP node8
        .node02_pesi (node02_pesi),
        .node02_pero (node02_pero),
        .node02_pedi (node02_pedi),
        .node02_peri (node02_peri),
        .node02_peso (node02_peso),
        .node02_pedo (node02_pedo),

        // node (1,2) ↔ CMP node9
        .node12_pesi (node12_pesi),
        .node12_pero (node12_pero),
        .node12_pedi (node12_pedi),
        .node12_peri (node12_peri),
        .node12_peso (node12_peso),
        .node12_pedo (node12_pedo),

        // node (2,2) ↔ CMP node10
        .node22_pesi (node22_pesi),
        .node22_pero (node22_pero),
        .node22_pedi (node22_pedi),
        .node22_peri (node22_peri),
        .node22_peso (node22_peso),
        .node22_pedo (node22_pedo),

        // node (3,2) ↔ CMP node11
        .node32_pesi (node32_pesi),
        .node32_pero (node32_pero),
        .node32_pedi (node32_pedi),
        .node32_peri (node32_peri),
        .node32_peso (node32_peso),
        .node32_pedo (node32_pedo),

        // ---------------- row y = 3 ----------------
        // node (0,3) ↔ CMP node12
        .node03_pesi (node03_pesi),
        .node03_pero (node03_pero),
        .node03_pedi (node03_pedi),
        .node03_peri (node03_peri),
        .node03_peso (node03_peso),
        .node03_pedo (node03_pedo),

        // node (1,3) ↔ CMP node13
        .node13_pesi (node13_pesi),
        .node13_pero (node13_pero),
        .node13_pedi (node13_pedi),
        .node13_peri (node13_peri),
        .node13_peso (node13_peso),
        .node13_pedo (node13_pedo),

        // node (2,3) ↔ CMP node14
        .node23_pesi (node23_pesi),
        .node23_pero (node23_pero),
        .node23_pedi (node23_pedi),
        .node23_peri (node23_peri),
        .node23_peso (node23_peso),
        .node23_pedo (node23_pedo),

        // node (3,3) ↔ CMP node15
        .node33_pesi (node33_pesi),
        .node33_pero (node33_pero),
        .node33_pedi (node33_pedi),
        .node33_peri (node33_peri),
        .node33_peso (node33_peso),
        .node33_pedo (node33_pedo)
    );


    // ========= NICs =========

    // NIC0 ↔ node00 ↔ CPU0
    cardinal_nic NIC0 (
        .clk         (clk),
        .reset       (reset),

        .addr        (nic0_addr),
        .d_in        (nic0_din),
        .d_out       (nic0_dout),
        .nicEn       (nic0_en),
        .nicEnWr     (nic0_wrEn),

        .net_si      (node00_peso),
        .net_ri      (node00_peri),
        .net_di      (node00_pedo),
        .net_so      (node00_pesi),
        .net_ro      (node00_pero),
        .net_do      (node00_pedi),
        .net_polarity(polarity)
    );

    // NIC1 ↔ node10 ↔ CPU1
    cardinal_nic NIC1 (
        .clk         (clk),
        .reset       (reset),

        .addr        (nic1_addr),
        .d_in        (nic1_din),
        .d_out       (nic1_dout),
        .nicEn       (nic1_en),
        .nicEnWr     (nic1_wrEn),

        .net_si      (node10_peso),
        .net_ri      (node10_peri),
        .net_di      (node10_pedo),
        .net_so      (node10_pesi),
        .net_ro      (node10_pero),
        .net_do      (node10_pedi),
        .net_polarity(polarity)
    );

    // NIC2 ↔ node20 ↔ CPU2
    cardinal_nic NIC2 (
        .clk         (clk),
        .reset       (reset),

        .addr        (nic2_addr),
        .d_in        (nic2_din),
        .d_out       (nic2_dout),
        .nicEn       (nic2_en),
        .nicEnWr     (nic2_wrEn),

        .net_si      (node20_peso),
        .net_ri      (node20_peri),
        .net_di      (node20_pedo),
        .net_so      (node20_pesi),
        .net_ro      (node20_pero),
        .net_do      (node20_pedi),
        .net_polarity(polarity)
    );

    // NIC3 ↔ node30 ↔ CPU3
    cardinal_nic NIC3 (
        .clk         (clk),
        .reset       (reset),

        .addr        (nic3_addr),
        .d_in        (nic3_din),
        .d_out       (nic3_dout),
        .nicEn       (nic3_en),
        .nicEnWr     (nic3_wrEn),

        .net_si      (node30_peso),
        .net_ri      (node30_peri),
        .net_di      (node30_pedo),
        .net_so      (node30_pesi),
        .net_ro      (node30_pero),
        .net_do      (node30_pedi),
        .net_polarity(polarity)
    );

    // NIC4 ↔ node01 ↔ CPU4
    cardinal_nic NIC4 (
        .clk         (clk),
        .reset       (reset),

        .addr        (nic4_addr),
        .d_in        (nic4_din),
        .d_out       (nic4_dout),
        .nicEn       (nic4_en),
        .nicEnWr     (nic4_wrEn),

        .net_si      (node01_peso),
        .net_ri      (node01_peri),
        .net_di      (node01_pedo),
        .net_so      (node01_pesi),
        .net_ro      (node01_pero),
        .net_do      (node01_pedi),
        .net_polarity(polarity)
    );

    // NIC5 ↔ node11 ↔ CPU5
    cardinal_nic NIC5 (
        .clk         (clk),
        .reset       (reset),

        .addr        (nic5_addr),
        .d_in        (nic5_din),
        .d_out       (nic5_dout),
        .nicEn       (nic5_en),
        .nicEnWr     (nic5_wrEn),

        .net_si      (node11_peso),
        .net_ri      (node11_peri),
        .net_di      (node11_pedo),
        .net_so      (node11_pesi),
        .net_ro      (node11_pero),
        .net_do      (node11_pedi),
        .net_polarity(polarity)
    );

    // NIC6 ↔ node21 ↔ CPU6
    cardinal_nic NIC6 (
        .clk         (clk),
        .reset       (reset),

        .addr        (nic6_addr),
        .d_in        (nic6_din),
        .d_out       (nic6_dout),
        .nicEn       (nic6_en),
        .nicEnWr     (nic6_wrEn),

        .net_si      (node21_peso),
        .net_ri      (node21_peri),
        .net_di      (node21_pedo),
        .net_so      (node21_pesi),
        .net_ro      (node21_pero),
        .net_do      (node21_pedi),
        .net_polarity(polarity)
    );

    // NIC7 ↔ node31 ↔ CPU7
    cardinal_nic NIC7 (
        .clk         (clk),
        .reset       (reset),

        .addr        (nic7_addr),
        .d_in        (nic7_din),
        .d_out       (nic7_dout),
        .nicEn       (nic7_en),
        .nicEnWr     (nic7_wrEn),

        .net_si      (node31_peso),
        .net_ri      (node31_peri),
        .net_di      (node31_pedo),
        .net_so      (node31_pesi),
        .net_ro      (node31_pero),
        .net_do      (node31_pedi),
        .net_polarity(polarity)
    );

    // NIC8 ↔ node02 ↔ CPU8
    cardinal_nic NIC8 (
        .clk         (clk),
        .reset       (reset),

        .addr        (nic8_addr),
        .d_in        (nic8_din),
        .d_out       (nic8_dout),
        .nicEn       (nic8_en),
        .nicEnWr     (nic8_wrEn),

        .net_si      (node02_peso),
        .net_ri      (node02_peri),
        .net_di      (node02_pedo),
        .net_so      (node02_pesi),
        .net_ro      (node02_pero),
        .net_do      (node02_pedi),
        .net_polarity(polarity)
    );

    // NIC9 ↔ node12 ↔ CPU9
    cardinal_nic NIC9 (
        .clk         (clk),
        .reset       (reset),

        .addr        (nic9_addr),
        .d_in        (nic9_din),
        .d_out       (nic9_dout),
        .nicEn       (nic9_en),
        .nicEnWr     (nic9_wrEn),

        .net_si      (node12_peso),
        .net_ri      (node12_peri),
        .net_di      (node12_pedo),
        .net_so      (node12_pesi),
        .net_ro      (node12_pero),
        .net_do      (node12_pedi),
        .net_polarity(polarity)
    );

    // NIC10 ↔ node22 ↔ CPU10
    cardinal_nic NIC10 (
        .clk         (clk),
        .reset       (reset),

        .addr        (nic10_addr),
        .d_in        (nic10_din),
        .d_out       (nic10_dout),
        .nicEn       (nic10_en),
        .nicEnWr     (nic10_wrEn),

        .net_si      (node22_peso),
        .net_ri      (node22_peri),
        .net_di      (node22_pedo),
        .net_so      (node22_pesi),
        .net_ro      (node22_pero),
        .net_do      (node22_pedi),
        .net_polarity(polarity)
    );

    // NIC11 ↔ node32 ↔ CPU11
    cardinal_nic NIC11 (
        .clk         (clk),
        .reset       (reset),

        .addr        (nic11_addr),
        .d_in        (nic11_din),
        .d_out       (nic11_dout),
        .nicEn       (nic11_en),
        .nicEnWr     (nic11_wrEn),

        .net_si      (node32_peso),
        .net_ri      (node32_peri),
        .net_di      (node32_pedo),
        .net_so      (node32_pesi),
        .net_ro      (node32_pero),
        .net_do      (node32_pedi),
        .net_polarity(polarity)
    );

    // NIC12 ↔ node03 ↔ CPU12
    cardinal_nic NIC12 (
        .clk         (clk),
        .reset       (reset),

        .addr        (nic12_addr),
        .d_in        (nic12_din),
        .d_out       (nic12_dout),
        .nicEn       (nic12_en),
        .nicEnWr     (nic12_wrEn),

        .net_si      (node03_peso),
        .net_ri      (node03_peri),
        .net_di      (node03_pedo),
        .net_so      (node03_pesi),
        .net_ro      (node03_pero),
        .net_do      (node03_pedi),
        .net_polarity(polarity)
    );

    // NIC13 ↔ node13 ↔ CPU13
    cardinal_nic NIC13 (
        .clk         (clk),
        .reset       (reset),

        .addr        (nic13_addr),
        .d_in        (nic13_din),
        .d_out       (nic13_dout),
        .nicEn       (nic13_en),
        .nicEnWr     (nic13_wrEn),

        .net_si      (node13_peso),
        .net_ri      (node13_peri),
        .net_di      (node13_pedo),
        .net_so      (node13_pesi),
        .net_ro      (node13_pero),
        .net_do      (node13_pedi),
        .net_polarity(polarity)
    );

    // NIC14 ↔ node23 ↔ CPU14
    cardinal_nic NIC14 (
        .clk         (clk),
        .reset       (reset),

        .addr        (nic14_addr),
        .d_in        (nic14_din),
        .d_out       (nic14_dout),
        .nicEn       (nic14_en),
        .nicEnWr     (nic14_wrEn),

        .net_si      (node23_peso),
        .net_ri      (node23_peri),
        .net_di      (node23_pedo),
        .net_so      (node23_pesi),
        .net_ro      (node23_pero),
        .net_do      (node23_pedi),
        .net_polarity(polarity)
    );

    // NIC15 ↔ node33 ↔ CPU15
    cardinal_nic NIC15 (
        .clk         (clk),
        .reset       (reset),

        .addr        (nic15_addr),
        .d_in        (nic15_din),
        .d_out       (nic15_dout),
        .nicEn       (nic15_en),
        .nicEnWr     (nic15_wrEn),

        .net_si      (node33_peso),
        .net_ri      (node33_peri),
        .net_di      (node33_pedo),
        .net_so      (node33_pesi),
        .net_ro      (node33_pero),
        .net_do      (node33_pedi),
        .net_polarity(polarity)
    );




    // ========= CPUs =========

    // CPU0 ↔ node0 ↔ NIC0
    cardinal_cpu CPU0 (
        .clk              (clk),
        .reset            (reset),

        .Instr_from_imem  (node0_inst_in),
        .data_from_dmem   (node0_d_in),

        .PC               (node0_pc_out),
        .memEn_to_dmem    (node0_memEn),
        .memWrEn_to_dmem  (node0_memWrEn),
        .memAddr_to_dmem  (node0_addr_out),
        .data_to_dmem     (node0_d_out),

        .addr_nic         (nic0_addr),
        .din_to_nic       (nic0_din),
        .dout_from_nic    (nic0_dout),
        .nicEn            (nic0_en),
        .nicWrEn          (nic0_wrEn)
    );

    // CPU1 ↔ node1 ↔ NIC1
    cardinal_cpu CPU1 (
        .clk              (clk),
        .reset            (reset),

        .Instr_from_imem  (node1_inst_in),
        .data_from_dmem   (node1_d_in),

        .PC               (node1_pc_out),
        .memEn_to_dmem    (node1_memEn),
        .memWrEn_to_dmem  (node1_memWrEn),
        .memAddr_to_dmem  (node1_addr_out),
        .data_to_dmem     (node1_d_out),

        .addr_nic         (nic1_addr),
        .din_to_nic       (nic1_din),
        .dout_from_nic    (nic1_dout),
        .nicEn            (nic1_en),
        .nicWrEn          (nic1_wrEn)
    );

    // CPU2 ↔ node2 ↔ NIC2
    cardinal_cpu CPU2 (
        .clk              (clk),
        .reset            (reset),

        .Instr_from_imem  (node2_inst_in),
        .data_from_dmem   (node2_d_in),

        .PC               (node2_pc_out),
        .memEn_to_dmem    (node2_memEn),
        .memWrEn_to_dmem  (node2_memWrEn),
        .memAddr_to_dmem  (node2_addr_out),
        .data_to_dmem     (node2_d_out),

        .addr_nic         (nic2_addr),
        .din_to_nic       (nic2_din),
        .dout_from_nic    (nic2_dout),
        .nicEn            (nic2_en),
        .nicWrEn          (nic2_wrEn)
    );

    // CPU3 ↔ node3 ↔ NIC3
    cardinal_cpu CPU3 (
        .clk              (clk),
        .reset            (reset),

        .Instr_from_imem  (node3_inst_in),
        .data_from_dmem   (node3_d_in),

        .PC               (node3_pc_out),
        .memEn_to_dmem    (node3_memEn),
        .memWrEn_to_dmem  (node3_memWrEn),
        .memAddr_to_dmem  (node3_addr_out),
        .data_to_dmem     (node3_d_out),

        .addr_nic         (nic3_addr),
        .din_to_nic       (nic3_din),
        .dout_from_nic    (nic3_dout),
        .nicEn            (nic3_en),
        .nicWrEn          (nic3_wrEn)
    );

    // CPU4 ↔ node4 ↔ NIC4
    cardinal_cpu CPU4 (
        .clk              (clk),
        .reset            (reset),

        .Instr_from_imem  (node4_inst_in),
        .data_from_dmem   (node4_d_in),

        .PC               (node4_pc_out),
        .memEn_to_dmem    (node4_memEn),
        .memWrEn_to_dmem  (node4_memWrEn),
        .memAddr_to_dmem  (node4_addr_out),
        .data_to_dmem     (node4_d_out),

        .addr_nic         (nic4_addr),
        .din_to_nic       (nic4_din),
        .dout_from_nic    (nic4_dout),
        .nicEn            (nic4_en),
        .nicWrEn          (nic4_wrEn)
    );

    // CPU5 ↔ node5 ↔ NIC5
    cardinal_cpu CPU5 (
        .clk              (clk),
        .reset            (reset),

        .Instr_from_imem  (node5_inst_in),
        .data_from_dmem   (node5_d_in),

        .PC               (node5_pc_out),
        .memEn_to_dmem    (node5_memEn),
        .memWrEn_to_dmem  (node5_memWrEn),
        .memAddr_to_dmem  (node5_addr_out),
        .data_to_dmem     (node5_d_out),

        .addr_nic         (nic5_addr),
        .din_to_nic       (nic5_din),
        .dout_from_nic    (nic5_dout),
        .nicEn            (nic5_en),
        .nicWrEn          (nic5_wrEn)
    );

    // CPU6 ↔ node6 ↔ NIC6
    cardinal_cpu CPU6 (
        .clk              (clk),
        .reset            (reset),

        .Instr_from_imem  (node6_inst_in),
        .data_from_dmem   (node6_d_in),

        .PC               (node6_pc_out),
        .memEn_to_dmem    (node6_memEn),
        .memWrEn_to_dmem  (node6_memWrEn),
        .memAddr_to_dmem  (node6_addr_out),
        .data_to_dmem     (node6_d_out),

        .addr_nic         (nic6_addr),
        .din_to_nic       (nic6_din),
        .dout_from_nic    (nic6_dout),
        .nicEn            (nic6_en),
        .nicWrEn          (nic6_wrEn)
    );

    // CPU7 ↔ node7 ↔ NIC7
    cardinal_cpu CPU7 (
        .clk              (clk),
        .reset            (reset),

        .Instr_from_imem  (node7_inst_in),
        .data_from_dmem   (node7_d_in),

        .PC               (node7_pc_out),
        .memEn_to_dmem    (node7_memEn),
        .memWrEn_to_dmem  (node7_memWrEn),
        .memAddr_to_dmem  (node7_addr_out),
        .data_to_dmem     (node7_d_out),

        .addr_nic         (nic7_addr),
        .din_to_nic       (nic7_din),
        .dout_from_nic    (nic7_dout),
        .nicEn            (nic7_en),
        .nicWrEn          (nic7_wrEn)
    );

    // CPU8 ↔ node8 ↔ NIC8
    cardinal_cpu CPU8 (
        .clk              (clk),
        .reset            (reset),

        .Instr_from_imem  (node8_inst_in),
        .data_from_dmem   (node8_d_in),

        .PC               (node8_pc_out),
        .memEn_to_dmem    (node8_memEn),
        .memWrEn_to_dmem  (node8_memWrEn),
        .memAddr_to_dmem  (node8_addr_out),
        .data_to_dmem     (node8_d_out),

        .addr_nic         (nic8_addr),
        .din_to_nic       (nic8_din),
        .dout_from_nic    (nic8_dout),
        .nicEn            (nic8_en),
        .nicWrEn          (nic8_wrEn)
    );

    // CPU9 ↔ node9 ↔ NIC9
    cardinal_cpu CPU9 (
        .clk              (clk),
        .reset            (reset),

        .Instr_from_imem  (node9_inst_in),
        .data_from_dmem   (node9_d_in),

        .PC               (node9_pc_out),
        .memEn_to_dmem    (node9_memEn),
        .memWrEn_to_dmem  (node9_memWrEn),
        .memAddr_to_dmem  (node9_addr_out),
        .data_to_dmem     (node9_d_out),

        .addr_nic         (nic9_addr),
        .din_to_nic       (nic9_din),
        .dout_from_nic    (nic9_dout),
        .nicEn            (nic9_en),
        .nicWrEn          (nic9_wrEn)
    );

    // CPU10 ↔ node10 ↔ NIC10
    cardinal_cpu CPU10 (
        .clk              (clk),
        .reset            (reset),

        .Instr_from_imem  (node10_inst_in),
        .data_from_dmem   (node10_d_in),

        .PC               (node10_pc_out),
        .memEn_to_dmem    (node10_memEn),
        .memWrEn_to_dmem  (node10_memWrEn),
        .memAddr_to_dmem  (node10_addr_out),
        .data_to_dmem     (node10_d_out),

        .addr_nic         (nic10_addr),
        .din_to_nic       (nic10_din),
        .dout_from_nic    (nic10_dout),
        .nicEn            (nic10_en),
        .nicWrEn          (nic10_wrEn)
    );

    // CPU11 ↔ node11 ↔ NIC11
    cardinal_cpu CPU11 (
        .clk              (clk),
        .reset            (reset),

        .Instr_from_imem  (node11_inst_in),
        .data_from_dmem   (node11_d_in),

        .PC               (node11_pc_out),
        .memEn_to_dmem    (node11_memEn),
        .memWrEn_to_dmem  (node11_memWrEn),
        .memAddr_to_dmem  (node11_addr_out),
        .data_to_dmem     (node11_d_out),

        .addr_nic         (nic11_addr),
        .din_to_nic       (nic11_din),
        .dout_from_nic    (nic11_dout),
        .nicEn            (nic11_en),
        .nicWrEn          (nic11_wrEn)
    );

    // CPU12 ↔ node12 ↔ NIC12
    cardinal_cpu CPU12 (
        .clk              (clk),
        .reset            (reset),

        .Instr_from_imem  (node12_inst_in),
        .data_from_dmem   (node12_d_in),

        .PC               (node12_pc_out),
        .memEn_to_dmem    (node12_memEn),
        .memWrEn_to_dmem  (node12_memWrEn),
        .memAddr_to_dmem  (node12_addr_out),
        .data_to_dmem     (node12_d_out),

        .addr_nic         (nic12_addr),
        .din_to_nic       (nic12_din),
        .dout_from_nic    (nic12_dout),
        .nicEn            (nic12_en),
        .nicWrEn          (nic12_wrEn)
    );

    // CPU13 ↔ node13 ↔ NIC13
    cardinal_cpu CPU13 (
        .clk              (clk),
        .reset            (reset),

        .Instr_from_imem  (node13_inst_in),
        .data_from_dmem   (node13_d_in),

        .PC               (node13_pc_out),
        .memEn_to_dmem    (node13_memEn),
        .memWrEn_to_dmem  (node13_memWrEn),
        .memAddr_to_dmem  (node13_addr_out),
        .data_to_dmem     (node13_d_out),

        .addr_nic         (nic13_addr),
        .din_to_nic       (nic13_din),
        .dout_from_nic    (nic13_dout),
        .nicEn            (nic13_en),
        .nicWrEn          (nic13_wrEn)
    );

    // CPU14 ↔ node14 ↔ NIC14
    cardinal_cpu CPU14 (
        .clk              (clk),
        .reset            (reset),

        .Instr_from_imem  (node14_inst_in),
        .data_from_dmem   (node14_d_in),

        .PC               (node14_pc_out),
        .memEn_to_dmem    (node14_memEn),
        .memWrEn_to_dmem  (node14_memWrEn),
        .memAddr_to_dmem  (node14_addr_out),
        .data_to_dmem     (node14_d_out),

        .addr_nic         (nic14_addr),
        .din_to_nic       (nic14_din),
        .dout_from_nic    (nic14_dout),
        .nicEn            (nic14_en),
        .nicWrEn          (nic14_wrEn)
    );

    // CPU15 ↔ node15 ↔ NIC15
    cardinal_cpu CPU15 (
        .clk              (clk),
        .reset            (reset),

        .Instr_from_imem  (node15_inst_in),
        .data_from_dmem   (node15_d_in),

        .PC               (node15_pc_out),
        .memEn_to_dmem    (node15_memEn),
        .memWrEn_to_dmem  (node15_memWrEn),
        .memAddr_to_dmem  (node15_addr_out),
        .data_to_dmem     (node15_d_out),

        .addr_nic         (nic15_addr),
        .din_to_nic       (nic15_din),
        .dout_from_nic    (nic15_dout),
        .nicEn            (nic15_en),
        .nicWrEn          (nic15_wrEn)
    );


endmodule
