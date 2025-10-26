
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
