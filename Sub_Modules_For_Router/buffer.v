//==============================================================
//  Module: buffer
//  Description:
//    1-flit register-based buffer with valid/ready handshake control.
//    Implements flow control for pipeline/NoC data transfer.
//
//==============================================================

module buffer (
    input  clk,              // System clock
    input  reset,            // Synchronous reset (active high)
    input  buffer_en,        // Enable flag to allow data transfer

    // ===== Upstream interface =====
    input  [63:0] buffer_di, // Data input from previous stage
    input         buffer_si, // Send in  (valid signal from previous stage)
    output reg    buffer_ri, // Ready in (buffer tells upstream it's ready to receive)

    // ===== Downstream interface =====
    input         buffer_ro, // Ready out (next stage ready to accept data)
    output reg    buffer_so, // Send out  (buffer has valid data)
    output [63:0] buffer_do  // Data output to next stage
);

