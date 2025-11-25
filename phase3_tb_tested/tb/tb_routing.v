`include "./include/gscl45nm.v"

module tb_simple_noc_test;

    reg clk, reset, polarity;

    // PE input (source = 10)
    reg        PEIB_si_10;
    reg [63:0] PEIB_di_10;
    wire       PEIB_ri_10;

    // PE output (dest = 00)
    wire       PEOB_so_00;
    wire [63:0] PEOB_do_00;
    reg        PEOB_ro_00;

    // 其餘 PE 接腳全貼 0（簡單處理）
    // Input valid
    reg PEIB_si_dummy [0:3][0:3];
    reg [63:0] PEIB_di_dummy [0:3][0:3];

    // Output ready
    reg PEOB_ro_dummy [0:3][0:3];

    // Output wires
    wire PEIB_ri_dummy [0:3][0:3];
    wire PEOB_so_dummy [0:3][0:3];
    wire [63:0] PEOB_do_dummy [0:3][0:3];

    integer x,y;

    // Instantiate DUT
    No_NIC_original uut (
        .clk(clk),
        .reset(reset),
        .polarity(polarity),

        // Inputs and outputs for all 16 PEs
        .PEIB_si_00(PEIB_si_dummy[0][0]),
        .PEIB_si_01(PEIB_si_dummy[0][1]),
        .PEIB_si_02(PEIB_si_dummy[0][2]),
        .PEIB_si_03(PEIB_si_dummy[0][3]),
        .PEIB_si_10(PEIB_si_10),
        .PEIB_si_11(PEIB_si_dummy[1][1]),
        .PEIB_si_12(PEIB_si_dummy[1][2]),
        .PEIB_si_13(PEIB_si_dummy[1][3]),
        .PEIB_si_20(PEIB_si_dummy[2][0]),
        .PEIB_si_21(PEIB_si_dummy[2][1]),
        .PEIB_si_22(PEIB_si_dummy[2][2]),
        .PEIB_si_23(PEIB_si_dummy[2][3]),
        .PEIB_si_30(PEIB_si_dummy[3][0]),
        .PEIB_si_31(PEIB_si_dummy[3][1]),
        .PEIB_si_32(PEIB_si_dummy[3][2]),
        .PEIB_si_33(PEIB_si_dummy[3][3]),

        .PEIB_di_00(PEIB_di_dummy[0][0]),
        .PEIB_di_01(PEIB_di_dummy[0][1]),
        .PEIB_di_02(PEIB_di_dummy[0][2]),
        .PEIB_di_03(PEIB_di_dummy[0][3]),
        .PEIB_di_10(PEIB_di_10),
        .PEIB_di_11(PEIB_di_dummy[1][1]),
        .PEIB_di_12(PEIB_di_dummy[1][2]),
        .PEIB_di_13(PEIB_di_dummy[1][3]),
        .PEIB_di_20(PEIB_di_dummy[2][0]),
        .PEIB_di_21(PEIB_di_dummy[2][1]),
        .PEIB_di_22(PEIB_di_dummy[2][2]),
        .PEIB_di_23(PEIB_di_dummy[2][3]),
        .PEIB_di_30(PEIB_di_dummy[3][0]),
        .PEIB_di_31(PEIB_di_dummy[3][1]),
        .PEIB_di_32(PEIB_di_dummy[3][2]),
        .PEIB_di_33(PEIB_di_dummy[3][3]),

        .PEIB_ri_00(PEIB_ri_dummy[0][0]),
        .PEIB_ri_01(PEIB_ri_dummy[0][1]),
        .PEIB_ri_02(PEIB_ri_dummy[0][2]),
        .PEIB_ri_03(PEIB_ri_dummy[0][3]),
        .PEIB_ri_10(PEIB_ri_10),
        .PEIB_ri_11(PEIB_ri_dummy[1][1]),
        .PEIB_ri_12(PEIB_ri_dummy[1][2]),
        .PEIB_ri_13(PEIB_ri_dummy[1][3]),
        .PEIB_ri_20(PEIB_ri_dummy[2][0]),
        .PEIB_ri_21(PEIB_ri_dummy[2][1]),
        .PEIB_ri_22(PEIB_ri_dummy[2][2]),
        .PEIB_ri_23(PEIB_ri_dummy[2][3]),
        .PEIB_ri_30(PEIB_ri_dummy[3][0]),
        .PEIB_ri_31(PEIB_ri_dummy[3][1]),
        .PEIB_ri_32(PEIB_ri_dummy[3][2]),
        .PEIB_ri_33(PEIB_ri_dummy[3][3]),

        .PEOB_so_00(PEOB_so_00),
        .PEOB_so_01(PEOB_so_dummy[0][1]),
        .PEOB_so_02(PEOB_so_dummy[0][2]),
        .PEOB_so_03(PEOB_so_dummy[0][3]),
        .PEOB_so_10(PEOB_so_dummy[1][0]),
        .PEOB_so_11(PEOB_so_dummy[1][1]),
        .PEOB_so_12(PEOB_so_dummy[1][2]),
        .PEOB_so_13(PEOB_so_dummy[1][3]),
        .PEOB_so_20(PEOB_so_dummy[2][0]),
        .PEOB_so_21(PEOB_so_dummy[2][1]),
        .PEOB_so_22(PEOB_so_dummy[2][2]),
        .PEOB_so_23(PEOB_so_dummy[2][3]),
        .PEOB_so_30(PEOB_so_dummy[3][0]),
        .PEOB_so_31(PEOB_so_dummy[3][1]),
        .PEOB_so_32(PEOB_so_dummy[3][2]),
        .PEOB_so_33(PEOB_so_dummy[3][3]),

        .PEOB_do_00(PEOB_do_00),
        .PEOB_do_01(PEOB_do_dummy[0][1]),
        .PEOB_do_02(PEOB_do_dummy[0][2]),
        .PEOB_do_03(PEOB_do_dummy[0][3]),
        .PEOB_do_10(PEOB_do_dummy[1][0]),
        .PEOB_do_11(PEOB_do_dummy[1][1]),
        .PEOB_do_12(PEOB_do_dummy[1][2]),
        .PEOB_do_13(PEOB_do_dummy[1][3]),
        .PEOB_do_20(PEOB_do_dummy[2][0]),
        .PEOB_do_21(PEOB_do_dummy[2][1]),
        .PEOB_do_22(PEOB_do_dummy[2][2]),
        .PEOB_do_23(PEOB_do_dummy[2][3]),
        .PEOB_do_30(PEOB_do_dummy[3][0]),
        .PEOB_do_31(PEOB_do_dummy[3][1]),
        .PEOB_do_32(PEOB_do_dummy[3][2]),
        .PEOB_do_33(PEOB_do_dummy[3][3]),

        .PEOB_ro_00(PEOB_ro_00),
        .PEOB_ro_01(PEOB_ro_dummy[0][1]),
        .PEOB_ro_02(PEOB_ro_dummy[0][2]),
        .PEOB_ro_03(PEOB_ro_dummy[0][3]),
        .PEOB_ro_10(PEOB_ro_dummy[1][0]),
        .PEOB_ro_11(PEOB_ro_dummy[1][1]),
        .PEOB_ro_12(PEOB_ro_dummy[1][2]),
        .PEOB_ro_13(PEOB_ro_dummy[1][3]),
        .PEOB_ro_20(PEOB_ro_dummy[2][0]),
        .PEOB_ro_21(PEOB_ro_dummy[2][1]),
        .PEOB_ro_22(PEOB_ro_dummy[2][2]),
        .PEOB_ro_23(PEOB_ro_dummy[2][3]),
        .PEOB_ro_30(PEOB_ro_dummy[3][0]),
        .PEOB_ro_31(PEOB_ro_dummy[3][1]),
        .PEOB_ro_32(PEOB_ro_dummy[3][2]),
        .PEOB_ro_33(PEOB_ro_dummy[3][3])
    );

    // Clock
    always #12 clk = ~clk;
    always #24 polarity = ~polarity;

    initial begin
        clk = 0;
        polarity = 0;

        // init all dummy ports = 0
        for (x=0; x<4; x++)
            for (y=0; y<4; y++) begin
                PEIB_si_dummy[x][y] = 0;
                PEIB_di_dummy[x][y] = 0;
                PEOB_ro_dummy[x][y] = 0;
            end

        reset = 1;
        PEIB_si_10 = 0;
        PEOB_ro_00 = 0;

        #100;
        reset = 0;

        // -----------------------
        // 送一筆封包：從 node(1,0) → node(0,0)
        // -----------------------
        $display("Sending a packet from (1,0) to (0,0)");

        // Packet 格式（可依你 mesh 設計）：dest_x | dest_y | src_x | src_y | payload
        PEIB_di_10 = {4'h0,4'h0,4'h1,4'h0, 48'hDEADBEEF1234};

        PEIB_si_10 = 1;     // valid = 1
        #48;
        PEIB_si_10 = 0;     // 停止送封包

        // destination ready
        PEOB_ro_00 = 1;

        // -----------------------
        // 等封包
        // -----------------------
        fork
            begin : timeout_block
                #2000;
                $display("FAIL: Timeout, packet did not arrive.");
                disable check_packet;
            end

            begin : check_packet
                wait(PEOB_so_00 == 1);
                $display("Packet received at (0,0): %h", PEOB_do_00);

                if (PEOB_do_00 == PEIB_di_10)
                    $display("PASS: Packet matched expected value!");
                else
                    $display("FAIL: Received packet does not match.");

                disable timeout_block;
            end
        join

        #100;
        $finish;
    end

endmodule
