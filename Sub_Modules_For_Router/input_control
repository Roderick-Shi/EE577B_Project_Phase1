//==============================================================
//  Module: input_control

//==============================================================
`timescale 1ns/1ps

module buffer (
    input  clk,              // System clock
    input  reset,            // Synchronous reset (active high)
    input  buffer_en,        // Enable flag to allow data transfer

    // ===== Upstream interface =====
    input  [63:0] buffer_di, // Data input from previous stage
    input         buffer_si, // Send-in  (valid signal from upstream)
    output reg    buffer_ri, // Ready-in (tells upstream this buffer can receive)

    // ===== Downstream interface =====
    input         buffer_ro, // Ready-out (next stage ready to accept data)
    output reg    buffer_so, // Send-out  (this buffer has valid data to send)
    output reg [63:0] buffer_do  // Data output to next stage
);

    
    // State definition
   
    reg [0:0] state; 
	reg [63:0] data_reg; 
	
	localparam RECEIVE = 1'b0;
    localparam SEND    = 1'b1;

    
    // Output and handshake logic
    assign buffer_do = data_reg;                // Always drive data output
    assign buffer_so = (state == SEND);         // Valid flag asserted in SEND state
    assign buffer_ri = (state == RECEIVE) || buffer_ro;
    //  - Ready when empty (RECEIVE)
    //  - Or when downstream ready (allows back-to-back transfer)
    //  -> This enables "elastic" pipeline behavior

 
    // Sequential logic: FSM transitions
    always @(posedge clk) begin
        if (reset) begin
            // --- Reset behavior ---
            state    <= RECEIVE;    // Start empty
            data_reg <= 64'd0;
        end else begin
            // --- Normal operation ---
            case (state)
                //--------------------------------------------------
                // State 0: RECEIVE (buffer empty)
                //--------------------------------------------------
                RECEIVE: begin
                    // If enabled, upstream has valid data, and buffer is ready:
                    if (buffer_si && buffer_ri) begin
                        data_reg <= buffer_di; // Capture new data
                        state    <= SEND;      // Buffer now full
                    end
                end

                //--------------------------------------------------
                // State 1: SEND (buffer full)
                //--------------------------------------------------
                SEND: begin
                    // If downstream accepts data this cycle:
                    if (buffer_en && buffer_so && buffer_ro) begin
                        state <= RECEIVE; // Buffer becomes empty
                        // data_reg content can remain; valid flag (state) controls use
                    end
                end
            endcase
        end
    end

endmodule


module input_control (
    input  clk,
    input  reset,
    input  polarity,                   // Polarity bit for VC alternation

    // ===== Upstream connection (from another router or NIC) =====
    input         upstream_buffer_si,  // Valid (upstream has data)
    input  [63:0] upstream_buffer_di,  // Data from upstream
    output        upstream_buffer_ri,  // Ready (this controller can accept)

    // ===== Downstream connection (to output buffers) =====
    input  outbuffer_up_ro,            // Ready from output buffer North
    input  outbuffer_down_ro,          // Ready from output buffer South
    input  outbuffer_left_ro,          // Ready from output buffer West
    input  outbuffer_right_ro,         // Ready from output buffer East
    input  outbuffer_NIC_ro,           // Ready from NIC output buffer

    output reg [63:0] buffer_do,       // Data sent to output buffers
    output reg        out_up_so,       // Valid to North OB
    output reg        out_down_so,     // Valid to South OB
    output reg        out_left_so,     // Valid to West OB
    output reg        out_right_so,    // Valid to East OB
    output reg        out_NIC_so       // Valid to NIC OB
);

    //--------------------------------------------------------------
    // Internal wires and registers
    //--------------------------------------------------------------
    wire [63:0] buffer_do_wire;      // Data from internal buffer
    wire        buffer_so_wire;      // Buffer has valid data
    reg         buffer_en;        // Controls buffer send enable

    // Hop counters extracted from header
    reg signed [3:0] hop_x, hop_y;
    reg signed [3:0] hop_x_new, hop_y_new;

    // Virtual channel bit (MSB)
    wire vc_bit;
    assign vc_bit = upstream_buffer_di[63];

    //--------------------------------------------------------------
    // VC gating: external/internal control
    //--------------------------------------------------------------
   
    wire internal_transfer_wire = vc_bit ~^ polarity;  // Send allowed if VC == polarity

    //--------------------------------------------------------------
    // Internal buffer instance
    //--------------------------------------------------------------
    buffer i_buf (
        .clk(clk),
        .reset(reset),
        .buffer_en(buffer_en),
        .buffer_di(upstream_buffer_di),
        .buffer_si(upstream_buffer_si),
        .buffer_ri(upstream_buffer_ri),
        .buffer_ro(internal_transfer_wire),   // downstream ready only when polarity matches Ready-out (next stage ready to accept data) this is input of buffer
        .buffer_so(buffer_so_wire),  // Send-out  (this buffer has valid data to send) this is output of buffer
        .buffer_do(buffer_do_wire)
    );

    //--------------------------------------------------------------
    // Routing: determine output direction based on hop fields
    //--------------------------------------------------------------
    always @(*) begin
        // Extract hop counts
        hop_x = buffer_do_wire[55:52];
        hop_y = buffer_do_wire[51:48];

        hop_x_new = hop_x;
        hop_y_new = hop_y;

        // Default no valid asserted
        out_up_so    = 1'b0;
        out_down_so  = 1'b0;
        out_left_so  = 1'b0;
        out_right_so = 1'b0;
        out_NIC_so   = 1'b0;

        // No data by default
        buffer_do = buffer_do_wire;

        // Send enable only if buffer has valid data and allowed to send
        buffer_en = 1'b0;

        if (buffer_so_wire && internal_transfer_wire) begin
            // ---- Decide direction ----
            if (hop_x > 0 && outbuffer_right_ro) begin
                hop_x_new = hop_x - 1;
                buffer_do = {buffer_do_wire[63:56], hop_x_new, hop_y_new, buffer_do_wire[47:0]};
                out_right_so = 1'b1;
                buffer_en = 1'b1;
            end
            else if (hop_x < 0 && outbuffer_left_ro) begin
                hop_x_new = hop_x + 1;
                buffer_do = {buffer_do_wire[63:56], hop_x_new, hop_y_new, buffer_do_wire[47:0]};
                out_left_so = 1'b1;
                buffer_en = 1'b1;
            end
            else if (hop_x == 0 && hop_y > 0 && outbuffer_up_ro) begin
                hop_y_new = hop_y - 1;
                buffer_do = {buffer_do_wire[63:56], hop_x_new, hop_y_new, buffer_do_wire[47:0]};
                out_up_so = 1'b1;
                buffer_en = 1'b1;
            end
            else if (hop_x == 0 && hop_y < 0 && outbuffer_down_ro) begin
                hop_y_new = hop_y + 1;
                buffer_do = {buffer_do_wire[63:56], hop_x_new, hop_y_new, buffer_do_wire[47:0]};
                out_down_so = 1'b1;
                buffer_en = 1'b1;
            end
            else if (hop_x == 0 && hop_y == 0 && outbuffer_NIC_ro) begin
                // Packet reached its destination
                buffer_do = buffer_do_wire;
                out_NIC_so = 1'b1;
                buffer_en = 1'b1;
            end
        end
    end

endmodule



  
