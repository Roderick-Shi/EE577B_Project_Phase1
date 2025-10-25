//==============================================================
//  Module: output_control 

//==============================================================
module rr_arbiter (
    input        clk,
    input        reset,
    input  [4:0] request,   // 5 requesters: {NIC, RIGHT, LEFT, DOWN, UP}
    output reg [4:0] grant  // One-hot grant to selected requester
);

    reg [4:0] pointer;      // One-hot rotating priority pointer

    integer i;

    //==========================================================
    // Combinational Grant Logic (Prioritized starting at pointer)
    //==========================================================
    always @(*) begin
        grant = 5'b00000;

        // Check request in priority order based on pointer position
        for (i = 0; i < 5; i = i + 1) begin
            if (pointer[i]) begin
                // Priority: i, i+1, i+2, i+3, i+4 wrapped around
                if (request[i]) begin
                    grant[i] = 1'b1;
                end
                else if (request[(i+1)%5]) begin
                    grant[(i+1)%5] = 1'b1;
                end
                else if (request[(i+2)%5]) begin
                    grant[(i+2)%5] = 1'b1;
                end
                else if (request[(i+3)%5]) begin
                    grant[(i+3)%5] = 1'b1;
                end
                else if (request[(i+4)%5]) begin
                    grant[(i+4)%5] = 1'b1;
                end
            end
        end
    end

    //==========================================================
    // Priority Pointer Rotation on Successful Grant
    //==========================================================
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pointer <= 5'b00001;   // Start giving UP highest priority first
        end
        else if (grant != 0) begin
            // Rotate pointer based on who just won
            pointer <= {grant[3:0], grant[4]};
        end
    end

endmodule

/*
| Bit Index | One-Hot | Port Name   | Physical Direction         |
| --------: | :-----: | ----------- | -------------------------- |
|         0 | `00001` | UP          | North input → North output |
|         1 | `00010` | DOWN        | South                      |
|         2 | `00100` | LEFT        | West                       |
|         3 | `01000` | RIGHT       | East                       |
|         4 | `10000` | NIC / Local | To attached processor core |
*/



//==============================================================
//  Module: output_controller
//  Function:
//    - Accept flits from 4 incoming directions
//    - Use RR arbiter to select one requester if multiple
//    - Store selected flit into local output buffer
//    - Signal pop back to winning requester only
//==============================================================

module output_controller (
    input  clk,
    input  reset,
    input  polarity,   // VC arbitration sync

    // ========= Incoming requests from 4 directions =========
    input        up_si,
    input [63:0] up_di,

    input        down_si,
    input [63:0] down_di,

    input        left_si,
    input [63:0] left_di,

    input        right_si,
    input [63:0] right_di,

    // ========= To next router (output buffer interface) =========
    output       output_so,      // valid
    output [63:0]output_do,      // data
    input        output_ro,      // ready

    // ========= Ready (pop) back to input controllers =========
    output reg   up_ri,
    output reg   down_ri,
    output reg   left_ri,
    output reg   right_ri
);

    // -----------------------------------------------------------
    // Internal Request Signals
    // Bit index mapping same as your arbiter:
    // request = {NIC?, RIGHT, LEFT, DOWN, UP}
    // Here NIC input not used ⇒ 0 for bit 4
    // -----------------------------------------------------------
    wire [4:0] req;
    assign req = {1'b0, right_si, left_si, down_si, up_si};

    wire [4:0] grant;

    // -----------------------------------------------------------
    // Round Robin Arbiter
    // -----------------------------------------------------------
    rr_arbiter arb (
        .clk(clk),
        .reset(reset),
        .request(req),
        .grant(grant)
    );

    // Decode winner
    wire g_up    = grant[0];
    wire g_down  = grant[1];
    wire g_left  = grant[2];
    wire g_right = grant[3];

    // VC rule: header bit must match polarity
    wire vc_ok =
        (g_up    ? (up_di[63]    == polarity) :
         g_down  ? (down_di[63]  == polarity) :
         g_left  ? (left_di[63]  == polarity) :
         g_right ? (right_di[63] == polarity) :
         1'b0);

    // -----------------------------------------------------------
    // Crossbar select data
    // -----------------------------------------------------------
    reg [63:0] xbar_data;
    always @(*) begin
        if      (g_up)    xbar_data = up_di;
        else if (g_down)  xbar_data = down_di;
        else if (g_left)  xbar_data = left_di;
        else if (g_right) xbar_data = right_di;
        else              xbar_data = 64'd0;
    end

    // -----------------------------------------------------------
    // Output buffer instance
    // buffer_en asserted only when:
    // - A valid grant exists
    // - VC polarity matches
    // -----------------------------------------------------------
    wire buf_full_valid;     // buffer_so
    wire [63:0] buf_data;    // buffer_do
    wire buf_ready_prev;     // buffer_ri

    wire buffer_en = (grant != 0) && vc_ok;

    buffer obuf (
        .clk(clk),
        .reset(reset),
        .buffer_en(buffer_en),
        .buffer_di(xbar_data),
        .buffer_si(|grant), // valid flit to capture
        .buffer_ri(buf_ready_prev),
        .buffer_ro(output_ro),
        .buffer_so(buf_full_valid),
        .buffer_do(buf_data)
    );

    assign output_so = buf_full_valid;
    assign output_do = buf_data;

    // -----------------------------------------------------------
    // Ready (pop) feedback
    // Only granted input receives pop when flit transferred
    // -----------------------------------------------------------
    always @(*) begin
        up_ri    = (g_up    && buffer_en && buf_ready_prev);
        down_ri  = (g_down  && buffer_en && buf_ready_prev);
        left_ri  = (g_left  && buffer_en && buf_ready_prev);
        right_ri = (g_right && buffer_en && buf_ready_prev);
    end

endmodule

/*
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
