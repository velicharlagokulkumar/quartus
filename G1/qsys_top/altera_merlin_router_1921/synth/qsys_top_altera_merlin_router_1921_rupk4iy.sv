// (C) 2001-2022 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.



// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $Id: //acds/rel/22.4/ip/iconnect/merlin/altera_merlin_router/altera_merlin_router.sv.terp#1 $
// $Revision: #1 $
// $Date: 2022/10/20 $

// -------------------------------------------------------
// Merlin Router
//
// Asserts the appropriate one-hot encoded channel based on 
// the dest id.
//
// -------------------------------------------------------

`timescale 1 ns / 1 ns

// ------------------------------------------
// Generation parameters:
//    decoder_type            1 (dest id decoder)
//    default_channel         0
//    default_destid          0
//    default_rd_channel      -1
//    default_wr_channel      -1
//    has_default_slave       0
//    memory_aliasing_decode  0
//    output_name             qsys_top_altera_merlin_router_1921_rupk4iy
//    pkt_addr_h              40
//    pkt_addr_l              36
//    pkt_dest_id_h           63
//    pkt_dest_id_l           63
//    pkt_protection_h        67
//    pkt_protection_l        65
//    pkt_trans_read          44
//    pkt_trans_write         43
//    slaves_info             0:1:0x0:0x0:write:1:0:0:1
//    st_channel_w            1
//    st_data_w               86
// ------------------------------------------

module qsys_top_altera_merlin_router_1921_rupk4iy_default_decode
  #(
     parameter DEFAULT_CHANNEL = 0,
               DEFAULT_WR_CHANNEL = -1,
               DEFAULT_RD_CHANNEL = -1,
               DEFAULT_DESTID = 0 
   )
  (output [63 - 63 : 0] default_destination_id,
   output [1-1 : 0] default_wr_channel,
   output [1-1 : 0] default_rd_channel,
   output [1-1 : 0] default_src_channel
  );

  assign default_destination_id = 
    DEFAULT_DESTID[63 - 63 : 0];

  generate
    if (DEFAULT_CHANNEL == -1) begin : no_default_channel_assignment
      assign default_src_channel = '0;
    end
    else begin : default_channel_assignment
      assign default_src_channel = 1'b1 << DEFAULT_CHANNEL;
    end
  endgenerate

  generate
    if (DEFAULT_RD_CHANNEL == -1) begin : no_default_rw_channel_assignment
      assign default_wr_channel = '0;
      assign default_rd_channel = '0;
    end
    else begin : default_rw_channel_assignment
      assign default_wr_channel = 1'b1 << DEFAULT_WR_CHANNEL;
      assign default_rd_channel = 1'b1 << DEFAULT_RD_CHANNEL;
    end
  endgenerate

endmodule


module qsys_top_altera_merlin_router_1921_rupk4iy
(
    // -------------------
    // Clock & Reset
    // -------------------
    input clk,
    input reset,

    // -------------------
    // Command Sink (Input)
    // -------------------
    input                       sink_valid,
    input  [86-1 : 0]    sink_data,
    input                       sink_startofpacket,
    input                       sink_endofpacket,
    output                      sink_ready,

    // -------------------
    // Command Source (Output)
    // -------------------
    output                          src_valid,
    output reg [86-1    : 0] src_data,
    output reg [1-1 : 0] src_channel,
    output                          src_startofpacket,
    output                          src_endofpacket,
    input                           src_ready
);

    // -------------------------------------------------------
    // Local parameters and variables
    // -------------------------------------------------------
    localparam PKT_ADDR_H = 40;
    localparam PKT_ADDR_L = 36;
    localparam PKT_DEST_ID_H = 63;
    localparam PKT_DEST_ID_L = 63;
    localparam PKT_PROTECTION_H = 67;
    localparam PKT_PROTECTION_L = 65;
    localparam ST_DATA_W = 86;
    localparam ST_CHANNEL_W = 1;
    localparam DECODER_TYPE = 1;

    localparam PKT_TRANS_WRITE = 43;
    localparam PKT_TRANS_READ  = 44;

    localparam PKT_ADDR_W = PKT_ADDR_H-PKT_ADDR_L + 1;
    localparam PKT_DEST_ID_W = PKT_DEST_ID_H-PKT_DEST_ID_L + 1;



    // -------------------------------------------------------
    // Figure out the number of bits to mask off for each slave span
    // during address decoding
    // -------------------------------------------------------
    // -------------------------------------------------------
    // Work out which address bits are significant based on the
    // address range of the slaves. If the required width is too
    // large or too small, we use the address field width instead.
    // -------------------------------------------------------
    localparam ADDR_RANGE = 64'h0;
    localparam RANGE_ADDR_WIDTH = log2ceil(ADDR_RANGE);
    localparam OPTIMIZED_ADDR_H = (RANGE_ADDR_WIDTH > PKT_ADDR_W) ||
                                  (RANGE_ADDR_WIDTH == 0) ?
                                        PKT_ADDR_H :
                                        PKT_ADDR_L + RANGE_ADDR_WIDTH - 1;

    localparam REAL_ADDRESS_RANGE = OPTIMIZED_ADDR_H - PKT_ADDR_L;

    reg [PKT_DEST_ID_W-1 : 0] destid;

    // -------------------------------------------------------
    // Pass almost everything through, untouched
    // -------------------------------------------------------
    assign sink_ready        = src_ready;
    assign src_valid         = sink_valid;
    assign src_startofpacket = sink_startofpacket;
    assign src_endofpacket   = sink_endofpacket;
    wire [1-1 : 0] default_src_channel;




    // -------------------------------------------------------
    // Write and read transaction signals
    // -------------------------------------------------------
    wire write_transaction;
    assign write_transaction = sink_data[PKT_TRANS_WRITE];


    qsys_top_altera_merlin_router_1921_rupk4iy_default_decode the_default_decode(
      .default_destination_id (),
      .default_wr_channel   (),
      .default_rd_channel   (),
      .default_src_channel  (default_src_channel)
    );

    always @* begin
        src_data    = sink_data;
        src_channel = default_src_channel;

        // --------------------------------------------------
        // DestinationID Decoder
        // Sets the channel based on the destination ID.
        // --------------------------------------------------
        destid      = sink_data[PKT_DEST_ID_H : PKT_DEST_ID_L];



        if (destid == 0  && write_transaction) begin
            src_channel = 1'b1;
        end

    end


    // --------------------------------------------------
    // Ceil(log2()) function
    // It's the 21st century. Consider using $clog2().
    // --------------------------------------------------
    function integer log2ceil;
        input reg[65:0] val;
        reg [65:0] i;

        begin
            i = 1;
            log2ceil = 0;

            while (i < val) begin
                log2ceil = log2ceil + 1;
                i = i << 1;
            end
        end
    endfunction

endmodule


