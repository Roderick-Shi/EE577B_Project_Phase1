module cardinal_nic(
    input         clk,
    input         reset,

    // CPU side
    input  [1:0]  addr,
    input  [63:0] d_in,
    output reg [63:0] d_out,
    input         nicEn,
    input         nicEnWr,

    // Router side
    input         net_si,
    output        net_ri,
    input  [63:0] net_di,
    output        net_so,
    input         net_ro,
    output reg [63:0] net_do,
    input         net_polarity
);

    //------------------------------------------------------------
    // Internal status registers (NOT external ports)
    //------------------------------------------------------------
    reg out_status;
    reg in_status;

    //------------------------------------------------------------
    //=====[ Network Output Channel: Processor -> NIC -> Router ]=====
    //------------------------------------------------------------

    // Router must have opposite polarity to accept this VC
    wire polarity_vc_match = (net_do[63] != net_polarity);

    // NIC sends only when: buffer full AND router ready AND polarity matches
    assign net_so = (out_status && net_ro) && polarity_vc_match;

    // Output buffer can be written when writing to NIC and buffer is empty (or about to send)
    wire out_buff_en = (nicEn && nicEnWr) &&
                       ((out_status == 0) || net_so) &&
                       (addr == 2'b10);

    // Output channel buffer
    always @(posedge clk) begin
        if (reset) 
            net_do <= 64'b0;
        else if (out_buff_en)
            net_do <= d_in;
    end

    // Output status register
    always @(posedge clk) begin
        if (reset)
            out_status <= 1'b0;
        else if (out_buff_en)
            out_status <= 1'b1;
        else if (net_so && ~out_buff_en)
            out_status <= 1'b0;
    end

    //------------------------------------------------------------
    //=====[ Network Input Channel: Router -> NIC -> Processor ]=====
    //------------------------------------------------------------

    reg [63:0] input_channel_buf_out;

    // PE reads input buffer if load + NIC access + addr==00
    wire pe_read_InBuffer = nicEn && ~nicEnWr && (addr == 2'b00);

    // NIC can accept packet when buffer empty OR PE is about to clear it
    assign net_ri = ~in_status || pe_read_InBuffer;

    // New packet arrives when router sends AND NIC ready
    wire in_buff_en = net_si && net_ri;

    // Input channel buffer
    always @(posedge clk) begin
        if (reset)
            input_channel_buf_out <= 64'b0;
        else if (in_buff_en)
            input_channel_buf_out <= net_di;
    end

    // Input status register
    always @(posedge clk) begin
        if (reset)
            in_status <= 1'b0;
        else if (in_buff_en)
            in_status <= 1'b1;
        else if (pe_read_InBuffer)
            in_status <= 1'b0;
    end

    //------------------------------------------------------------
    //=====[ NIC Register Address Decode ]=====
    //------------------------------------------------------------

    always @(*) begin
        if (!nicEn) begin
            d_out = 64'b0;
        end else begin
            case (addr)
                2'b00: d_out = input_channel_buf_out;        // Input buffer
                2'b01: d_out = {63'b0, in_status};           // Input status
                2'b10: d_out = 64'b0;                        // Output buffer (write-only)
                2'b11: d_out = {63'b0, out_status};          // Output status
                default: d_out = 64'b0;
            endcase
        end
    end

endmodule
