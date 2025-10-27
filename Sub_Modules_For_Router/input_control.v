module input_controller_4out_flat 
#(
    parameter IDX_W   = 0,
    parameter IDX_E   = 1,
    parameter IDX_S   = 2,
    parameter IDX_NIC = 3,
    parameter IDX_U   = 2   // if needed for UP mapping
)(
    input        clk,
    input        reset,
    input        polarity,

    // Upstream flit source
    input        upstream_si,
    input [63:0] upstream_di,
    output       upstream_ri,

    // Ready from each downstream OC
    input        out_ready0,
    input        out_ready1,
    input        out_ready2,
    input        out_ready3,

    // Valid signals to OCs
    output       out_valid0,
    output       out_valid1,
    output       out_valid2,
    output       out_valid3,

    // Data to OCs
    output [63:0] out_data0,
    output [63:0] out_data1,
    output [63:0] out_data2,
    output [63:0] out_data3
);

    //=============================
    // 1️⃣ VC Gating + Buffer
    //=============================
    wire vc_match = (upstream_di[63] == polarity);

    wire buf_ri, buf_so, buf_ro;
    wire [63:0] buf_do;
    assign buf_ro = vc_match;

    buffer INBUF (
        .clk(clk), .reset(reset),
        .buffer_en(1'b1),
        .buffer_di(upstream_di),
        .buffer_si(upstream_si),
        .buffer_ri(upstream_ri),
        .buffer_ro(buf_ro),
        .buffer_so(buf_so),
        .buffer_do(buf_do)
    );

    //=============================
    // 2️⃣ Extract routing fields
    //=============================
    wire dir_x = buf_do[62];
    wire dir_y = buf_do[61];

    wire [3:0] hop_x = buf_do[55:52];
    wire [3:0] hop_y = buf_do[51:48];

    reg [3:0] sel;
    reg [63:0] updated_flit;

    //=============================
    // 3️⃣ XY Routing Logic
    //=============================
    always @(*) begin
        sel = 4'b0000;
        updated_flit = buf_do;

        if (buf_so) begin

            if (hop_x > 0) begin
                if (dir_x == 1'b0) begin
                    sel[IDX_E] = 1'b1;    // Move right
                end else begin
                    sel[IDX_W] = 1'b1;    // Move left
                end
                updated_flit[55:52] = hop_x - 1;
            end

            else if (hop_y > 0) begin
                if (dir_y == 1'b0) begin
                    sel[IDX_U] = 1'b1;    // Move up
                end else begin
                    sel[IDX_S] = 1'b1;    // Move down
                end
                updated_flit[51:48] = hop_y - 1;
            end

            else begin
                sel[IDX_NIC] = 1'b1;     // Destination reached
            end
        end
    end

    //=============================
    // 4️⃣ Generate Output Valid/Data
    //=============================
    assign out_valid0 = buf_so & sel[0];
    assign out_valid1 = buf_so & sel[1];
    assign out_valid2 = buf_so & sel[2];
    assign out_valid3 = buf_so & sel[3];

    assign out_data0 = updated_flit;
    assign out_data1 = updated_flit;
    assign out_data2 = updated_flit;
    assign out_data3 = updated_flit;

endmodule
