`include "lisnoc_def.vh"

module lisnoc_mesh3x3_sd
  ( 

    link0_in_flit_i, link0_in_valid_i, link0_in_ready_o,
    link0_out_flit_o, link0_out_valid_o, link0_out_ready_i,

    link1_in_flit_i, link1_in_valid_i, link1_in_ready_o,
    link1_out_flit_o, link1_out_valid_o, link1_out_ready_i,

    link2_in_flit_i, link2_in_valid_i, link2_in_ready_o,
    link2_out_flit_o, link2_out_valid_o, link2_out_ready_i,

    link3_in_flit_i, link3_in_valid_i, link3_in_ready_o,
    link3_out_flit_o, link3_out_valid_o, link3_out_ready_i,

    link4_in_flit_i, link4_in_valid_i, link4_in_ready_o,
    link4_out_flit_o, link4_out_valid_o, link4_out_ready_i,

    link5_in_flit_i, link5_in_valid_i, link5_in_ready_o,
    link5_out_flit_o, link5_out_valid_o, link5_out_ready_i,

    link6_in_flit_i, link6_in_valid_i, link6_in_ready_o,
    link6_out_flit_o, link6_out_valid_o, link6_out_ready_i,

    link7_in_flit_i, link7_in_valid_i, link7_in_ready_o,
    link7_out_flit_o, link7_out_valid_o, link7_out_ready_i,

    link8_in_flit_i, link8_in_valid_i, link8_in_ready_o,
    link8_out_flit_o, link8_out_valid_o, link8_out_ready_i,

    clk, rst
    );


   parameter flit_data_width = 32;
   parameter flit_type_width = 2;
   localparam flit_width = flit_data_width+flit_type_width;
   parameter ph_dest_width = 5;

   parameter vchannels = 1;

   input clk;
   input rst;

   input [flit_width-1:0] link0_in_flit_i;
   input [vchannels-1:0] link0_in_valid_i /*verilator sc_bv*/;
   output [vchannels-1:0] link0_in_ready_o /*verilator sc_bv*/;
   output [flit_width-1:0] link0_out_flit_o;
   output [vchannels-1:0] link0_out_valid_o /*verilator sc_bv*/;
   input [vchannels-1:0] link0_out_ready_i /*verilator sc_bv*/;

   input [flit_width-1:0] link1_in_flit_i;
   input [vchannels-1:0] link1_in_valid_i /*verilator sc_bv*/;
   output [vchannels-1:0] link1_in_ready_o /*verilator sc_bv*/;
   output [flit_width-1:0] link1_out_flit_o;
   output [vchannels-1:0] link1_out_valid_o /*verilator sc_bv*/;
   input [vchannels-1:0] link1_out_ready_i /*verilator sc_bv*/;

   input [flit_width-1:0] link2_in_flit_i;
   input [vchannels-1:0] link2_in_valid_i /*verilator sc_bv*/;
   output [vchannels-1:0] link2_in_ready_o /*verilator sc_bv*/;
   output [flit_width-1:0] link2_out_flit_o;
   output [vchannels-1:0] link2_out_valid_o /*verilator sc_bv*/;
   input [vchannels-1:0] link2_out_ready_i /*verilator sc_bv*/;

   input [flit_width-1:0] link3_in_flit_i;
   input [vchannels-1:0] link3_in_valid_i /*verilator sc_bv*/;
   output [vchannels-1:0] link3_in_ready_o /*verilator sc_bv*/;
   output [flit_width-1:0] link3_out_flit_o;
   output [vchannels-1:0] link3_out_valid_o /*verilator sc_bv*/;
   input [vchannels-1:0] link3_out_ready_i /*verilator sc_bv*/;

   input [flit_width-1:0] link4_in_flit_i;
   input [vchannels-1:0] link4_in_valid_i /*verilator sc_bv*/;
   output [vchannels-1:0] link4_in_ready_o /*verilator sc_bv*/;
   output [flit_width-1:0] link4_out_flit_o;
   output [vchannels-1:0] link4_out_valid_o /*verilator sc_bv*/;
   input [vchannels-1:0] link4_out_ready_i /*verilator sc_bv*/;

   input [flit_width-1:0] link5_in_flit_i;
   input [vchannels-1:0] link5_in_valid_i /*verilator sc_bv*/;
   output [vchannels-1:0] link5_in_ready_o /*verilator sc_bv*/;
   output [flit_width-1:0] link5_out_flit_o;
   output [vchannels-1:0] link5_out_valid_o /*verilator sc_bv*/;
   input [vchannels-1:0] link5_out_ready_i /*verilator sc_bv*/;

   input [flit_width-1:0] link6_in_flit_i;
   input [vchannels-1:0] link6_in_valid_i /*verilator sc_bv*/;
   output [vchannels-1:0] link6_in_ready_o /*verilator sc_bv*/;
   output [flit_width-1:0] link6_out_flit_o;
   output [vchannels-1:0] link6_out_valid_o /*verilator sc_bv*/;
   input [vchannels-1:0] link6_out_ready_i /*verilator sc_bv*/;

   input [flit_width-1:0] link7_in_flit_i;
   input [vchannels-1:0] link7_in_valid_i /*verilator sc_bv*/;
   output [vchannels-1:0] link7_in_ready_o /*verilator sc_bv*/;
   output [flit_width-1:0] link7_out_flit_o;
   output [vchannels-1:0] link7_out_valid_o /*verilator sc_bv*/;
   input [vchannels-1:0] link7_out_ready_i /*verilator sc_bv*/;

   input [flit_width-1:0] link8_in_flit_i;
   input [vchannels-1:0] link8_in_valid_i /*verilator sc_bv*/;
   output [vchannels-1:0] link8_in_ready_o /*verilator sc_bv*/;
   output [flit_width-1:0] link8_out_flit_o;
   output [vchannels-1:0] link8_out_valid_o /*verilator sc_bv*/;
   input [vchannels-1:0] link8_out_ready_i /*verilator sc_bv*/;


   wire [flit_width-1:0] north_in_flit[0:2][0:2];
   wire [vchannels-1:0] north_in_valid[0:2][0:2];
   wire [vchannels-1:0] north_in_ready[0:2][0:2];
   wire [flit_width-1:0] north_out_flit[0:2][0:2];
   wire [vchannels-1:0] north_out_valid[0:2][0:2];
   wire [vchannels-1:0] north_out_ready[0:2][0:2];
   wire [flit_width-1:0] east_in_flit[0:2][0:2];
   wire [vchannels-1:0] east_in_valid[0:2][0:2];
   wire [vchannels-1:0] east_in_ready[0:2][0:2];
   wire [flit_width-1:0] east_out_flit[0:2][0:2];
   wire [vchannels-1:0] east_out_valid[0:2][0:2];
   wire [vchannels-1:0] east_out_ready[0:2][0:2];
   wire [flit_width-1:0] south_in_flit[0:2][0:2];
   wire [vchannels-1:0] south_in_valid[0:2][0:2];
   wire [vchannels-1:0] south_in_ready[0:2][0:2];
   wire [flit_width-1:0] south_out_flit[0:2][0:2];
   wire [vchannels-1:0] south_out_valid[0:2][0:2];
   wire [vchannels-1:0] south_out_ready[0:2][0:2];
   wire [flit_width-1:0] west_in_flit[0:2][0:2];
   wire [vchannels-1:0] west_in_valid[0:2][0:2];
   wire [vchannels-1:0] west_in_ready[0:2][0:2];
   wire [flit_width-1:0] west_out_flit[0:2][0:2];
   wire [vchannels-1:0] west_out_valid[0:2][0:2];
   wire [vchannels-1:0] west_out_ready[0:2][0:2];



   /* Connecting (0,0) */
   assign north_in_flit[0][0]   = {flit_width{1'b0}};
   assign north_in_valid[0][0]  = {vchannels{1'b0}};
   assign north_out_ready[0][0] = {vchannels{1'b0}};


   assign west_in_flit[0][0]   = {flit_width{1'b0}};
   assign west_in_valid[0][0]  = {vchannels{1'b0}};
   assign west_out_ready[0][0] = {vchannels{1'b0}};



   /* Connecting (0,1) */
   assign north_in_flit[0][1]   = {flit_width{1'b0}};
   assign north_in_valid[0][1]  = {vchannels{1'b0}};
   assign north_out_ready[0][1] = {vchannels{1'b0}};


   assign west_in_flit[0][1]     = east_out_flit[0][0];
   assign west_in_valid[0][1]    = east_out_valid[0][0];
   assign east_out_ready[0][0] = west_in_ready[0][1];
   assign east_in_flit[0][0]   = west_out_flit[0][1];
   assign east_in_valid[0][0]  = west_out_valid[0][1];
   assign west_out_ready[0][1]   = east_in_ready[0][0];



   /* Connecting (0,2) */
   assign north_in_flit[0][2]   = {flit_width{1'b0}};
   assign north_in_valid[0][2]  = {vchannels{1'b0}};
   assign north_out_ready[0][2] = {vchannels{1'b0}};


   assign west_in_flit[0][2]     = east_out_flit[0][1];
   assign west_in_valid[0][2]    = east_out_valid[0][1];
   assign east_out_ready[0][1] = west_in_ready[0][2];
   assign east_in_flit[0][1]   = west_out_flit[0][2];
   assign east_in_valid[0][1]  = west_out_valid[0][2];
   assign west_out_ready[0][2]   = east_in_ready[0][1];

   assign east_in_flit[0][2]   = {flit_width{1'b0}};
   assign east_in_valid[0][2]  = {vchannels{1'b0}};
   assign east_out_ready[0][2] = {vchannels{1'b0}};




   /* Connecting (1,0) */
   assign north_in_flit[1][0]     = south_out_flit[0][0];
   assign north_in_valid[1][0]    = south_out_valid[0][0];
   assign south_out_ready[0][0] = north_in_ready[1][0];
   assign south_in_flit[0][0]   = north_out_flit[1][0];
   assign south_in_valid[0][0]  = north_out_valid[1][0];
   assign north_out_ready[1][0]   = south_in_ready[0][0];


   assign west_in_flit[1][0]   = {flit_width{1'b0}};
   assign west_in_valid[1][0]  = {vchannels{1'b0}};
   assign west_out_ready[1][0] = {vchannels{1'b0}};



   /* Connecting (1,1) */
   assign north_in_flit[1][1]     = south_out_flit[0][1];
   assign north_in_valid[1][1]    = south_out_valid[0][1];
   assign south_out_ready[0][1] = north_in_ready[1][1];
   assign south_in_flit[0][1]   = north_out_flit[1][1];
   assign south_in_valid[0][1]  = north_out_valid[1][1];
   assign north_out_ready[1][1]   = south_in_ready[0][1];


   assign west_in_flit[1][1]     = east_out_flit[1][0];
   assign west_in_valid[1][1]    = east_out_valid[1][0];
   assign east_out_ready[1][0] = west_in_ready[1][1];
   assign east_in_flit[1][0]   = west_out_flit[1][1];
   assign east_in_valid[1][0]  = west_out_valid[1][1];
   assign west_out_ready[1][1]   = east_in_ready[1][0];



   /* Connecting (1,2) */
   assign north_in_flit[1][2]     = south_out_flit[0][2];
   assign north_in_valid[1][2]    = south_out_valid[0][2];
   assign south_out_ready[0][2] = north_in_ready[1][2];
   assign south_in_flit[0][2]   = north_out_flit[1][2];
   assign south_in_valid[0][2]  = north_out_valid[1][2];
   assign north_out_ready[1][2]   = south_in_ready[0][2];


   assign west_in_flit[1][2]     = east_out_flit[1][1];
   assign west_in_valid[1][2]    = east_out_valid[1][1];
   assign east_out_ready[1][1] = west_in_ready[1][2];
   assign east_in_flit[1][1]   = west_out_flit[1][2];
   assign east_in_valid[1][1]  = west_out_valid[1][2];
   assign west_out_ready[1][2]   = east_in_ready[1][1];

   assign east_in_flit[1][2]   = {flit_width{1'b0}};
   assign east_in_valid[1][2]  = {vchannels{1'b0}};
   assign east_out_ready[1][2] = {vchannels{1'b0}};




   /* Connecting (2,0) */
   assign north_in_flit[2][0]     = south_out_flit[1][0];
   assign north_in_valid[2][0]    = south_out_valid[1][0];
   assign south_out_ready[1][0] = north_in_ready[2][0];
   assign south_in_flit[1][0]   = north_out_flit[2][0];
   assign south_in_valid[1][0]  = north_out_valid[2][0];
   assign north_out_ready[2][0]   = south_in_ready[1][0];

   assign south_in_flit[2][0]   = {flit_width{1'b0}};
   assign south_in_valid[2][0]  = {vchannels{1'b0}};
   assign south_out_ready[2][0] = {vchannels{1'b0}};

   assign west_in_flit[2][0]   = {flit_width{1'b0}};
   assign west_in_valid[2][0]  = {vchannels{1'b0}};
   assign west_out_ready[2][0] = {vchannels{1'b0}};



   /* Connecting (2,1) */
   assign north_in_flit[2][1]     = south_out_flit[1][1];
   assign north_in_valid[2][1]    = south_out_valid[1][1];
   assign south_out_ready[1][1] = north_in_ready[2][1];
   assign south_in_flit[1][1]   = north_out_flit[2][1];
   assign south_in_valid[1][1]  = north_out_valid[2][1];
   assign north_out_ready[2][1]   = south_in_ready[1][1];

   assign south_in_flit[2][1]   = {flit_width{1'b0}};
   assign south_in_valid[2][1]  = {vchannels{1'b0}};
   assign south_out_ready[2][1] = {vchannels{1'b0}};

   assign west_in_flit[2][1]     = east_out_flit[2][0];
   assign west_in_valid[2][1]    = east_out_valid[2][0];
   assign east_out_ready[2][0] = west_in_ready[2][1];
   assign east_in_flit[2][0]   = west_out_flit[2][1];
   assign east_in_valid[2][0]  = west_out_valid[2][1];
   assign west_out_ready[2][1]   = east_in_ready[2][0];



   /* Connecting (2,2) */
   assign north_in_flit[2][2]     = south_out_flit[1][2];
   assign north_in_valid[2][2]    = south_out_valid[1][2];
   assign south_out_ready[1][2] = north_in_ready[2][2];
   assign south_in_flit[1][2]   = north_out_flit[2][2];
   assign south_in_valid[1][2]  = north_out_valid[2][2];
   assign north_out_ready[2][2]   = south_in_ready[1][2];

   assign south_in_flit[2][2]   = {flit_width{1'b0}};
   assign south_in_valid[2][2]  = {vchannels{1'b0}};
   assign south_out_ready[2][2] = {vchannels{1'b0}};

   assign west_in_flit[2][2]     = east_out_flit[2][1];
   assign west_in_valid[2][2]    = east_out_valid[2][1];
   assign east_out_ready[2][1] = west_in_ready[2][2];
   assign east_in_flit[2][1]   = west_out_flit[2][2];
   assign east_in_valid[2][1]  = west_out_valid[2][2];
   assign west_out_ready[2][2]   = east_in_ready[2][1];

   assign east_in_flit[2][2]   = {flit_width{1'b0}};
   assign east_in_valid[2][2]  = {vchannels{1'b0}};
   assign east_out_ready[2][2] = {vchannels{1'b0}};







   lisnoc_router_sd_2dgrid
   # (.num_dests(9),.vchannels(vchannels),.lookup({`SELECT_LOCAL,`SELECT_EAST,`SELECT_EAST,`SELECT_SOUTH,`SELECT_SOUTH,`SELECT_SOUTH,`SELECT_SOUTH,`SELECT_SOUTH,`SELECT_SOUTH}),
      .flit_data_width(flit_data_width), .flit_type_width(flit_type_width), .ph_dest_width(ph_dest_width))
   u_router_0_0
     (
       .clk			(clk),
       .rst			(rst),
       .north_out_flit_o	(north_out_flit[0][0][flit_width-1:0]),
       .north_out_valid_o	(north_out_valid[0][0][vchannels-1:0]),
       .east_out_flit_o		(east_out_flit[0][0][flit_width-1:0]),
       .east_out_valid_o	(east_out_valid[0][0][vchannels-1:0]),
       .south_out_flit_o	(south_out_flit[0][0][flit_width-1:0]),
       .south_out_valid_o	(south_out_valid[0][0][vchannels-1:0]),
       .west_out_flit_o		(west_out_flit[0][0][flit_width-1:0]),
       .west_out_valid_o	(west_out_valid[0][0][vchannels-1:0]),
       .local_out_flit_o	(link0_out_flit_o[flit_width-1:0]),
       .local_out_valid_o	(link0_out_valid_o[vchannels-1:0]),
       .north_in_ready_o	(north_in_ready[0][0][vchannels-1:0]),
       .east_in_ready_o		(east_in_ready[0][0][vchannels-1:0]),
       .south_in_ready_o	(south_in_ready[0][0][vchannels-1:0]),
       .west_in_ready_o		(west_in_ready[0][0][vchannels-1:0]),
       .local_in_ready_o	(link0_in_ready_o[vchannels-1:0]),

       .north_out_ready_i	(north_out_ready[0][0][vchannels-1:0]),
       .east_out_ready_i	(east_out_ready[0][0][vchannels-1:0]),
       .south_out_ready_i	(south_out_ready[0][0][vchannels-1:0]),
       .west_out_ready_i	(west_out_ready[0][0][vchannels-1:0]),
       .local_out_ready_i	(link0_out_ready_i[vchannels-1:0]),
       .north_in_flit_i		(north_in_flit[0][0][flit_width-1:0]),
       .north_in_valid_i	(north_in_valid[0][0][vchannels-1:0]),
       .east_in_flit_i		(east_in_flit[0][0][flit_width-1:0]),
       .east_in_valid_i		(east_in_valid[0][0][vchannels-1:0]),
       .south_in_flit_i		(south_in_flit[0][0][flit_width-1:0]),
       .south_in_valid_i	(south_in_valid[0][0][vchannels-1:0]),
       .west_in_flit_i		(west_in_flit[0][0][flit_width-1:0]),
       .west_in_valid_i		(west_in_valid[0][0][vchannels-1:0]),
       .local_in_flit_i		(link0_in_flit_i[flit_width-1:0]),
       .local_in_valid_i	(link0_in_valid_i[vchannels-1:0])
    );

   lisnoc_router_sd_2dgrid
   # (.num_dests(9),.vchannels(vchannels),.lookup({`SELECT_WEST,`SELECT_LOCAL,`SELECT_EAST,`SELECT_SOUTH,`SELECT_SOUTH,`SELECT_SOUTH,`SELECT_SOUTH,`SELECT_SOUTH,`SELECT_SOUTH}),
      .flit_data_width(flit_data_width), .flit_type_width(flit_type_width), .ph_dest_width(ph_dest_width))
   u_router_0_1
     (
       .clk			(clk),
       .rst			(rst),
       .north_out_flit_o	(north_out_flit[0][1][flit_width-1:0]),
       .north_out_valid_o	(north_out_valid[0][1][vchannels-1:0]),
       .east_out_flit_o		(east_out_flit[0][1][flit_width-1:0]),
       .east_out_valid_o	(east_out_valid[0][1][vchannels-1:0]),
       .south_out_flit_o	(south_out_flit[0][1][flit_width-1:0]),
       .south_out_valid_o	(south_out_valid[0][1][vchannels-1:0]),
       .west_out_flit_o		(west_out_flit[0][1][flit_width-1:0]),
       .west_out_valid_o	(west_out_valid[0][1][vchannels-1:0]),
       .local_out_flit_o	(link1_out_flit_o[flit_width-1:0]),
       .local_out_valid_o	(link1_out_valid_o[vchannels-1:0]),
       .north_in_ready_o	(north_in_ready[0][1][vchannels-1:0]),
       .east_in_ready_o		(east_in_ready[0][1][vchannels-1:0]),
       .south_in_ready_o	(south_in_ready[0][1][vchannels-1:0]),
       .west_in_ready_o		(west_in_ready[0][1][vchannels-1:0]),
       .local_in_ready_o	(link1_in_ready_o[vchannels-1:0]),

       .north_out_ready_i	(north_out_ready[0][1][vchannels-1:0]),
       .east_out_ready_i	(east_out_ready[0][1][vchannels-1:0]),
       .south_out_ready_i	(south_out_ready[0][1][vchannels-1:0]),
       .west_out_ready_i	(west_out_ready[0][1][vchannels-1:0]),
       .local_out_ready_i	(link1_out_ready_i[vchannels-1:0]),
       .north_in_flit_i		(north_in_flit[0][1][flit_width-1:0]),
       .north_in_valid_i	(north_in_valid[0][1][vchannels-1:0]),
       .east_in_flit_i		(east_in_flit[0][1][flit_width-1:0]),
       .east_in_valid_i		(east_in_valid[0][1][vchannels-1:0]),
       .south_in_flit_i		(south_in_flit[0][1][flit_width-1:0]),
       .south_in_valid_i	(south_in_valid[0][1][vchannels-1:0]),
       .west_in_flit_i		(west_in_flit[0][1][flit_width-1:0]),
       .west_in_valid_i		(west_in_valid[0][1][vchannels-1:0]),
       .local_in_flit_i		(link1_in_flit_i[flit_width-1:0]),
       .local_in_valid_i	(link1_in_valid_i[vchannels-1:0])
    );

   lisnoc_router_sd_2dgrid
   # (.num_dests(9),.vchannels(vchannels),.lookup({`SELECT_WEST,`SELECT_WEST,`SELECT_LOCAL,`SELECT_SOUTH,`SELECT_SOUTH,`SELECT_SOUTH,`SELECT_SOUTH,`SELECT_SOUTH,`SELECT_SOUTH}),
      .flit_data_width(flit_data_width), .flit_type_width(flit_type_width), .ph_dest_width(ph_dest_width))
   u_router_0_2
     (
       .clk			(clk),
       .rst			(rst),
       .north_out_flit_o	(north_out_flit[0][2][flit_width-1:0]),
       .north_out_valid_o	(north_out_valid[0][2][vchannels-1:0]),
       .east_out_flit_o		(east_out_flit[0][2][flit_width-1:0]),
       .east_out_valid_o	(east_out_valid[0][2][vchannels-1:0]),
       .south_out_flit_o	(south_out_flit[0][2][flit_width-1:0]),
       .south_out_valid_o	(south_out_valid[0][2][vchannels-1:0]),
       .west_out_flit_o		(west_out_flit[0][2][flit_width-1:0]),
       .west_out_valid_o	(west_out_valid[0][2][vchannels-1:0]),
       .local_out_flit_o	(link2_out_flit_o[flit_width-1:0]),
       .local_out_valid_o	(link2_out_valid_o[vchannels-1:0]),
       .north_in_ready_o	(north_in_ready[0][2][vchannels-1:0]),
       .east_in_ready_o		(east_in_ready[0][2][vchannels-1:0]),
       .south_in_ready_o	(south_in_ready[0][2][vchannels-1:0]),
       .west_in_ready_o		(west_in_ready[0][2][vchannels-1:0]),
       .local_in_ready_o	(link2_in_ready_o[vchannels-1:0]),

       .north_out_ready_i	(north_out_ready[0][2][vchannels-1:0]),
       .east_out_ready_i	(east_out_ready[0][2][vchannels-1:0]),
       .south_out_ready_i	(south_out_ready[0][2][vchannels-1:0]),
       .west_out_ready_i	(west_out_ready[0][2][vchannels-1:0]),
       .local_out_ready_i	(link2_out_ready_i[vchannels-1:0]),
       .north_in_flit_i		(north_in_flit[0][2][flit_width-1:0]),
       .north_in_valid_i	(north_in_valid[0][2][vchannels-1:0]),
       .east_in_flit_i		(east_in_flit[0][2][flit_width-1:0]),
       .east_in_valid_i		(east_in_valid[0][2][vchannels-1:0]),
       .south_in_flit_i		(south_in_flit[0][2][flit_width-1:0]),
       .south_in_valid_i	(south_in_valid[0][2][vchannels-1:0]),
       .west_in_flit_i		(west_in_flit[0][2][flit_width-1:0]),
       .west_in_valid_i		(west_in_valid[0][2][vchannels-1:0]),
       .local_in_flit_i		(link2_in_flit_i[flit_width-1:0]),
       .local_in_valid_i	(link2_in_valid_i[vchannels-1:0])
    );



   lisnoc_router_sd_2dgrid
   # (.num_dests(9),.vchannels(vchannels),.lookup({`SELECT_NORTH,`SELECT_NORTH,`SELECT_NORTH,`SELECT_LOCAL,`SELECT_EAST,`SELECT_EAST,`SELECT_SOUTH,`SELECT_SOUTH,`SELECT_SOUTH}),
      .flit_data_width(flit_data_width), .flit_type_width(flit_type_width), .ph_dest_width(ph_dest_width))
   u_router_1_0
     (
       .clk			(clk),
       .rst			(rst),
       .north_out_flit_o	(north_out_flit[1][0][flit_width-1:0]),
       .north_out_valid_o	(north_out_valid[1][0][vchannels-1:0]),
       .east_out_flit_o		(east_out_flit[1][0][flit_width-1:0]),
       .east_out_valid_o	(east_out_valid[1][0][vchannels-1:0]),
       .south_out_flit_o	(south_out_flit[1][0][flit_width-1:0]),
       .south_out_valid_o	(south_out_valid[1][0][vchannels-1:0]),
       .west_out_flit_o		(west_out_flit[1][0][flit_width-1:0]),
       .west_out_valid_o	(west_out_valid[1][0][vchannels-1:0]),
       .local_out_flit_o	(link3_out_flit_o[flit_width-1:0]),
       .local_out_valid_o	(link3_out_valid_o[vchannels-1:0]),
       .north_in_ready_o	(north_in_ready[1][0][vchannels-1:0]),
       .east_in_ready_o		(east_in_ready[1][0][vchannels-1:0]),
       .south_in_ready_o	(south_in_ready[1][0][vchannels-1:0]),
       .west_in_ready_o		(west_in_ready[1][0][vchannels-1:0]),
       .local_in_ready_o	(link3_in_ready_o[vchannels-1:0]),

       .north_out_ready_i	(north_out_ready[1][0][vchannels-1:0]),
       .east_out_ready_i	(east_out_ready[1][0][vchannels-1:0]),
       .south_out_ready_i	(south_out_ready[1][0][vchannels-1:0]),
       .west_out_ready_i	(west_out_ready[1][0][vchannels-1:0]),
       .local_out_ready_i	(link3_out_ready_i[vchannels-1:0]),
       .north_in_flit_i		(north_in_flit[1][0][flit_width-1:0]),
       .north_in_valid_i	(north_in_valid[1][0][vchannels-1:0]),
       .east_in_flit_i		(east_in_flit[1][0][flit_width-1:0]),
       .east_in_valid_i		(east_in_valid[1][0][vchannels-1:0]),
       .south_in_flit_i		(south_in_flit[1][0][flit_width-1:0]),
       .south_in_valid_i	(south_in_valid[1][0][vchannels-1:0]),
       .west_in_flit_i		(west_in_flit[1][0][flit_width-1:0]),
       .west_in_valid_i		(west_in_valid[1][0][vchannels-1:0]),
       .local_in_flit_i		(link3_in_flit_i[flit_width-1:0]),
       .local_in_valid_i	(link3_in_valid_i[vchannels-1:0])
    );

   lisnoc_router_sd_2dgrid
   # (.num_dests(9),.vchannels(vchannels),.lookup({`SELECT_NORTH,`SELECT_NORTH,`SELECT_NORTH,`SELECT_WEST,`SELECT_LOCAL,`SELECT_EAST,`SELECT_SOUTH,`SELECT_SOUTH,`SELECT_SOUTH}),
      .flit_data_width(flit_data_width), .flit_type_width(flit_type_width), .ph_dest_width(ph_dest_width))
   u_router_1_1
     (
       .clk			(clk),
       .rst			(rst),
       .north_out_flit_o	(north_out_flit[1][1][flit_width-1:0]),
       .north_out_valid_o	(north_out_valid[1][1][vchannels-1:0]),
       .east_out_flit_o		(east_out_flit[1][1][flit_width-1:0]),
       .east_out_valid_o	(east_out_valid[1][1][vchannels-1:0]),
       .south_out_flit_o	(south_out_flit[1][1][flit_width-1:0]),
       .south_out_valid_o	(south_out_valid[1][1][vchannels-1:0]),
       .west_out_flit_o		(west_out_flit[1][1][flit_width-1:0]),
       .west_out_valid_o	(west_out_valid[1][1][vchannels-1:0]),
       .local_out_flit_o	(link4_out_flit_o[flit_width-1:0]),
       .local_out_valid_o	(link4_out_valid_o[vchannels-1:0]),
       .north_in_ready_o	(north_in_ready[1][1][vchannels-1:0]),
       .east_in_ready_o		(east_in_ready[1][1][vchannels-1:0]),
       .south_in_ready_o	(south_in_ready[1][1][vchannels-1:0]),
       .west_in_ready_o		(west_in_ready[1][1][vchannels-1:0]),
       .local_in_ready_o	(link4_in_ready_o[vchannels-1:0]),

       .north_out_ready_i	(north_out_ready[1][1][vchannels-1:0]),
       .east_out_ready_i	(east_out_ready[1][1][vchannels-1:0]),
       .south_out_ready_i	(south_out_ready[1][1][vchannels-1:0]),
       .west_out_ready_i	(west_out_ready[1][1][vchannels-1:0]),
       .local_out_ready_i	(link4_out_ready_i[vchannels-1:0]),
       .north_in_flit_i		(north_in_flit[1][1][flit_width-1:0]),
       .north_in_valid_i	(north_in_valid[1][1][vchannels-1:0]),
       .east_in_flit_i		(east_in_flit[1][1][flit_width-1:0]),
       .east_in_valid_i		(east_in_valid[1][1][vchannels-1:0]),
       .south_in_flit_i		(south_in_flit[1][1][flit_width-1:0]),
       .south_in_valid_i	(south_in_valid[1][1][vchannels-1:0]),
       .west_in_flit_i		(west_in_flit[1][1][flit_width-1:0]),
       .west_in_valid_i		(west_in_valid[1][1][vchannels-1:0]),
       .local_in_flit_i		(link4_in_flit_i[flit_width-1:0]),
       .local_in_valid_i	(link4_in_valid_i[vchannels-1:0])
    );

   lisnoc_router_sd_2dgrid
   # (.num_dests(9),.vchannels(vchannels),.lookup({`SELECT_NORTH,`SELECT_NORTH,`SELECT_NORTH,`SELECT_WEST,`SELECT_WEST,`SELECT_LOCAL,`SELECT_SOUTH,`SELECT_SOUTH,`SELECT_SOUTH}),
      .flit_data_width(flit_data_width), .flit_type_width(flit_type_width), .ph_dest_width(ph_dest_width))
   u_router_1_2
     (
       .clk			(clk),
       .rst			(rst),
       .north_out_flit_o	(north_out_flit[1][2][flit_width-1:0]),
       .north_out_valid_o	(north_out_valid[1][2][vchannels-1:0]),
       .east_out_flit_o		(east_out_flit[1][2][flit_width-1:0]),
       .east_out_valid_o	(east_out_valid[1][2][vchannels-1:0]),
       .south_out_flit_o	(south_out_flit[1][2][flit_width-1:0]),
       .south_out_valid_o	(south_out_valid[1][2][vchannels-1:0]),
       .west_out_flit_o		(west_out_flit[1][2][flit_width-1:0]),
       .west_out_valid_o	(west_out_valid[1][2][vchannels-1:0]),
       .local_out_flit_o	(link5_out_flit_o[flit_width-1:0]),
       .local_out_valid_o	(link5_out_valid_o[vchannels-1:0]),
       .north_in_ready_o	(north_in_ready[1][2][vchannels-1:0]),
       .east_in_ready_o		(east_in_ready[1][2][vchannels-1:0]),
       .south_in_ready_o	(south_in_ready[1][2][vchannels-1:0]),
       .west_in_ready_o		(west_in_ready[1][2][vchannels-1:0]),
       .local_in_ready_o	(link5_in_ready_o[vchannels-1:0]),

       .north_out_ready_i	(north_out_ready[1][2][vchannels-1:0]),
       .east_out_ready_i	(east_out_ready[1][2][vchannels-1:0]),
       .south_out_ready_i	(south_out_ready[1][2][vchannels-1:0]),
       .west_out_ready_i	(west_out_ready[1][2][vchannels-1:0]),
       .local_out_ready_i	(link5_out_ready_i[vchannels-1:0]),
       .north_in_flit_i		(north_in_flit[1][2][flit_width-1:0]),
       .north_in_valid_i	(north_in_valid[1][2][vchannels-1:0]),
       .east_in_flit_i		(east_in_flit[1][2][flit_width-1:0]),
       .east_in_valid_i		(east_in_valid[1][2][vchannels-1:0]),
       .south_in_flit_i		(south_in_flit[1][2][flit_width-1:0]),
       .south_in_valid_i	(south_in_valid[1][2][vchannels-1:0]),
       .west_in_flit_i		(west_in_flit[1][2][flit_width-1:0]),
       .west_in_valid_i		(west_in_valid[1][2][vchannels-1:0]),
       .local_in_flit_i		(link5_in_flit_i[flit_width-1:0]),
       .local_in_valid_i	(link5_in_valid_i[vchannels-1:0])
    );



   lisnoc_router_sd_2dgrid
   # (.num_dests(9),.vchannels(vchannels),.lookup({`SELECT_NORTH,`SELECT_NORTH,`SELECT_NORTH,`SELECT_NORTH,`SELECT_NORTH,`SELECT_NORTH,`SELECT_LOCAL,`SELECT_EAST,`SELECT_EAST}),
      .flit_data_width(flit_data_width), .flit_type_width(flit_type_width), .ph_dest_width(ph_dest_width))
   u_router_2_0
     (
       .clk			(clk),
       .rst			(rst),
       .north_out_flit_o	(north_out_flit[2][0][flit_width-1:0]),
       .north_out_valid_o	(north_out_valid[2][0][vchannels-1:0]),
       .east_out_flit_o		(east_out_flit[2][0][flit_width-1:0]),
       .east_out_valid_o	(east_out_valid[2][0][vchannels-1:0]),
       .south_out_flit_o	(south_out_flit[2][0][flit_width-1:0]),
       .south_out_valid_o	(south_out_valid[2][0][vchannels-1:0]),
       .west_out_flit_o		(west_out_flit[2][0][flit_width-1:0]),
       .west_out_valid_o	(west_out_valid[2][0][vchannels-1:0]),
       .local_out_flit_o	(link6_out_flit_o[flit_width-1:0]),
       .local_out_valid_o	(link6_out_valid_o[vchannels-1:0]),
       .north_in_ready_o	(north_in_ready[2][0][vchannels-1:0]),
       .east_in_ready_o		(east_in_ready[2][0][vchannels-1:0]),
       .south_in_ready_o	(south_in_ready[2][0][vchannels-1:0]),
       .west_in_ready_o		(west_in_ready[2][0][vchannels-1:0]),
       .local_in_ready_o	(link6_in_ready_o[vchannels-1:0]),

       .north_out_ready_i	(north_out_ready[2][0][vchannels-1:0]),
       .east_out_ready_i	(east_out_ready[2][0][vchannels-1:0]),
       .south_out_ready_i	(south_out_ready[2][0][vchannels-1:0]),
       .west_out_ready_i	(west_out_ready[2][0][vchannels-1:0]),
       .local_out_ready_i	(link6_out_ready_i[vchannels-1:0]),
       .north_in_flit_i		(north_in_flit[2][0][flit_width-1:0]),
       .north_in_valid_i	(north_in_valid[2][0][vchannels-1:0]),
       .east_in_flit_i		(east_in_flit[2][0][flit_width-1:0]),
       .east_in_valid_i		(east_in_valid[2][0][vchannels-1:0]),
       .south_in_flit_i		(south_in_flit[2][0][flit_width-1:0]),
       .south_in_valid_i	(south_in_valid[2][0][vchannels-1:0]),
       .west_in_flit_i		(west_in_flit[2][0][flit_width-1:0]),
       .west_in_valid_i		(west_in_valid[2][0][vchannels-1:0]),
       .local_in_flit_i		(link6_in_flit_i[flit_width-1:0]),
       .local_in_valid_i	(link6_in_valid_i[vchannels-1:0])
    );

   lisnoc_router_sd_2dgrid
   # (.num_dests(9),.vchannels(vchannels),.lookup({`SELECT_NORTH,`SELECT_NORTH,`SELECT_NORTH,`SELECT_NORTH,`SELECT_NORTH,`SELECT_NORTH,`SELECT_WEST,`SELECT_LOCAL,`SELECT_EAST}),
      .flit_data_width(flit_data_width), .flit_type_width(flit_type_width), .ph_dest_width(ph_dest_width))
   u_router_2_1
     (
       .clk			(clk),
       .rst			(rst),
       .north_out_flit_o	(north_out_flit[2][1][flit_width-1:0]),
       .north_out_valid_o	(north_out_valid[2][1][vchannels-1:0]),
       .east_out_flit_o		(east_out_flit[2][1][flit_width-1:0]),
       .east_out_valid_o	(east_out_valid[2][1][vchannels-1:0]),
       .south_out_flit_o	(south_out_flit[2][1][flit_width-1:0]),
       .south_out_valid_o	(south_out_valid[2][1][vchannels-1:0]),
       .west_out_flit_o		(west_out_flit[2][1][flit_width-1:0]),
       .west_out_valid_o	(west_out_valid[2][1][vchannels-1:0]),
       .local_out_flit_o	(link7_out_flit_o[flit_width-1:0]),
       .local_out_valid_o	(link7_out_valid_o[vchannels-1:0]),
       .north_in_ready_o	(north_in_ready[2][1][vchannels-1:0]),
       .east_in_ready_o		(east_in_ready[2][1][vchannels-1:0]),
       .south_in_ready_o	(south_in_ready[2][1][vchannels-1:0]),
       .west_in_ready_o		(west_in_ready[2][1][vchannels-1:0]),
       .local_in_ready_o	(link7_in_ready_o[vchannels-1:0]),

       .north_out_ready_i	(north_out_ready[2][1][vchannels-1:0]),
       .east_out_ready_i	(east_out_ready[2][1][vchannels-1:0]),
       .south_out_ready_i	(south_out_ready[2][1][vchannels-1:0]),
       .west_out_ready_i	(west_out_ready[2][1][vchannels-1:0]),
       .local_out_ready_i	(link7_out_ready_i[vchannels-1:0]),
       .north_in_flit_i		(north_in_flit[2][1][flit_width-1:0]),
       .north_in_valid_i	(north_in_valid[2][1][vchannels-1:0]),
       .east_in_flit_i		(east_in_flit[2][1][flit_width-1:0]),
       .east_in_valid_i		(east_in_valid[2][1][vchannels-1:0]),
       .south_in_flit_i		(south_in_flit[2][1][flit_width-1:0]),
       .south_in_valid_i	(south_in_valid[2][1][vchannels-1:0]),
       .west_in_flit_i		(west_in_flit[2][1][flit_width-1:0]),
       .west_in_valid_i		(west_in_valid[2][1][vchannels-1:0]),
       .local_in_flit_i		(link7_in_flit_i[flit_width-1:0]),
       .local_in_valid_i	(link7_in_valid_i[vchannels-1:0])
    );

   lisnoc_router_sd_2dgrid
   # (.num_dests(9),.vchannels(vchannels),.lookup({`SELECT_NORTH,`SELECT_NORTH,`SELECT_NORTH,`SELECT_NORTH,`SELECT_NORTH,`SELECT_NORTH,`SELECT_WEST,`SELECT_WEST,`SELECT_LOCAL}),
      .flit_data_width(flit_data_width), .flit_type_width(flit_type_width), .ph_dest_width(ph_dest_width))
   u_router_2_2
     (
       .clk			(clk),
       .rst			(rst),
       .north_out_flit_o	(north_out_flit[2][2][flit_width-1:0]),
       .north_out_valid_o	(north_out_valid[2][2][vchannels-1:0]),
       .east_out_flit_o		(east_out_flit[2][2][flit_width-1:0]),
       .east_out_valid_o	(east_out_valid[2][2][vchannels-1:0]),
       .south_out_flit_o	(south_out_flit[2][2][flit_width-1:0]),
       .south_out_valid_o	(south_out_valid[2][2][vchannels-1:0]),
       .west_out_flit_o		(west_out_flit[2][2][flit_width-1:0]),
       .west_out_valid_o	(west_out_valid[2][2][vchannels-1:0]),
       .local_out_flit_o	(link8_out_flit_o[flit_width-1:0]),
       .local_out_valid_o	(link8_out_valid_o[vchannels-1:0]),
       .north_in_ready_o	(north_in_ready[2][2][vchannels-1:0]),
       .east_in_ready_o		(east_in_ready[2][2][vchannels-1:0]),
       .south_in_ready_o	(south_in_ready[2][2][vchannels-1:0]),
       .west_in_ready_o		(west_in_ready[2][2][vchannels-1:0]),
       .local_in_ready_o	(link8_in_ready_o[vchannels-1:0]),

       .north_out_ready_i	(north_out_ready[2][2][vchannels-1:0]),
       .east_out_ready_i	(east_out_ready[2][2][vchannels-1:0]),
       .south_out_ready_i	(south_out_ready[2][2][vchannels-1:0]),
       .west_out_ready_i	(west_out_ready[2][2][vchannels-1:0]),
       .local_out_ready_i	(link8_out_ready_i[vchannels-1:0]),
       .north_in_flit_i		(north_in_flit[2][2][flit_width-1:0]),
       .north_in_valid_i	(north_in_valid[2][2][vchannels-1:0]),
       .east_in_flit_i		(east_in_flit[2][2][flit_width-1:0]),
       .east_in_valid_i		(east_in_valid[2][2][vchannels-1:0]),
       .south_in_flit_i		(south_in_flit[2][2][flit_width-1:0]),
       .south_in_valid_i	(south_in_valid[2][2][vchannels-1:0]),
       .west_in_flit_i		(west_in_flit[2][2][flit_width-1:0]),
       .west_in_valid_i		(west_in_valid[2][2][vchannels-1:0]),
       .local_in_flit_i		(link8_in_flit_i[flit_width-1:0]),
       .local_in_valid_i	(link8_in_valid_i[vchannels-1:0])
    );



endmodule

`include "lisnoc_undef.vh"
