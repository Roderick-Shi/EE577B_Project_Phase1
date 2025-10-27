`timescale 1ns/1ps

module tb_input_control;

    reg clk, reset;
    reg polarity;

    // Upstream interface
    reg         upstream_buffer_si;
    reg [63:0]  upstream_buffer_di;
    wire        upstream_buffer_ri;

    // Output buffers ready
    reg  outbuffer_up_ro;
    reg  outbuffer_down_ro;
    reg  outbuffer_left_ro;
    reg  outbuffer_right_ro;
    reg  outbuffer_NIC_ro;

    // Output signals from DUT
    wire [63:0] buffer_do;
    wire out_up_so, out_down_so, out_left_so, out_right_so, out_NIC_so;


    // Direction IDs
    localparam DIR_RIGHT = 0;
    localparam DIR_LEFT  = 1;
    localparam DIR_UP    = 2;
    localparam DIR_DOWN  = 3;
    localparam DIR_NIC   = 4;


    // DUT Instantiation
    input_control DUT (
        .clk(clk),
        .reset(reset),
        .polarity(polarity),

        .upstream_buffer_si(upstream_buffer_si),
        .upstream_buffer_di(upstream_buffer_di),
        .upstream_buffer_ri(upstream_buffer_ri),

        .outbuffer_up_ro(outbuffer_up_ro),
        .outbuffer_down_ro(outbuffer_down_ro),
        .outbuffer_left_ro(outbuffer_left_ro),
        .outbuffer_right_ro(outbuffer_right_ro),
        .outbuffer_NIC_ro(outbuffer_NIC_ro),

        .buffer_do(buffer_do),
        .out_up_so(out_up_so),
        .out_down_so(out_down_so),
        .out_left_so(out_left_so),
        .out_right_so(out_right_so),
        .out_NIC_so(out_NIC_so)
    );


    // 100 MHz clock
    initial clk = 0;
    always #5 clk = ~clk;

    // Toggle polarity each clock
    always @(posedge clk)
        polarity <= ~polarity;


    //  Send + buffer accept
    task send_flit(input [63:0] data);
    begin
        @(posedge clk);
        upstream_buffer_di = data;
        upstream_buffer_si = 1'b1;
        wait(upstream_buffer_ri);
        @(posedge clk);
        upstream_buffer_si = 1'b0;
    end
    endtask


    //  Directional routing test helper
    task send_and_route(
        input [63:0] data,
        input integer DIR
    );
    begin
        case (DIR)
            DIR_RIGHT: outbuffer_right_ro = 1;
            DIR_LEFT:  outbuffer_left_ro  = 1;
            DIR_UP:    outbuffer_up_ro    = 1;
            DIR_DOWN:  outbuffer_down_ro  = 1;
            DIR_NIC:   outbuffer_NIC_ro   = 1;
        endcase

        send_flit(data);

        //  Wait for the correct output valid signal
        wait( (DIR==DIR_RIGHT && out_right_so) ||
              (DIR==DIR_LEFT  && out_left_so ) ||
              (DIR==DIR_UP    && out_up_so   ) ||
              (DIR==DIR_DOWN  && out_down_so ) ||
              (DIR==DIR_NIC   && out_NIC_so  ) );

        @(posedge clk);

        // Release ready
        outbuffer_up_ro = 0;
        outbuffer_down_ro = 0;
        outbuffer_left_ro = 0;
        outbuffer_right_ro = 0;
        outbuffer_NIC_ro = 0;
    end
    endtask;


    // Main Test
    initial begin
        upstream_buffer_si = 0;
        upstream_buffer_di = 0;
        outbuffer_up_ro = 0;
        outbuffer_down_ro = 0;
        outbuffer_left_ro = 0;
        outbuffer_right_ro = 0;
        outbuffer_NIC_ro = 0;
        polarity = 0;

        reset = 1;
        repeat(3) @(posedge clk);
        reset = 0;

        $display("\n=========== TEST START ===========");

        $display("\nTEST 1: RIGHT");
        send_and_route({1'b0,7'd0,4'd2,4'd0,48'hAAAA}, DIR_RIGHT);

        $display("\nTEST 2: LEFT");
        send_and_route({1'b0,7'd0,4'hE,4'd0,48'hBBBB}, DIR_LEFT);

        $display("\nTEST 3: UP");
        send_and_route({1'b0,7'd0,4'd0,4'd3,48'hCCCC}, DIR_UP);

        $display("\nTEST 4: DOWN");
        send_and_route({1'b0,7'd0,4'd0,4'hD,48'hDDDD}, DIR_DOWN);

        $display("\nTEST 5: NIC");
        send_and_route({1'b0,7'd0,4'd0,4'd0,48'hEEEE}, DIR_NIC);

        $display("\n=========== TEST COMPLETE ===========\n");
        #20 $finish;
    end


    // Monitor for waveform text output
    initial begin
        $monitor("T=%0t | pol=%b | DIR Up/Down/Left/Right/NIC=%b%b%b%b%b | hopX=%04b hopY=%04b | data=%h",
                  $time, polarity,
                  out_up_so, out_down_so, out_left_so, out_right_so, out_NIC_so,
                  buffer_do[55:52], buffer_do[51:48], buffer_do);
    end

endmodule
