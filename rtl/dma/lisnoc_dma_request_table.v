/**
 * This file is part of LISNoC.
 * 
 * LISNoC is free hardware: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as 
 * published by the Free Software Foundation, either version 3 of 
 * the License, or (at your option) any later version.
 *
 * As the LGPL in general applies to software, the meaning of
 * "linking" is defined as using the LISNoC in your projects at
 * the external interfaces.
 * 
 * LISNoC is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public 
 * License along with LISNoC. If not, see <http://www.gnu.org/licenses/>.
 * 
 * =================================================================
 * 
 * DMA transfer table
 * The DMA transfer table holds all requests and their corresponding
 * life-cycle between the interface and the control handler. To save
 * ports on the memory, each the request and status are dual ported,
 * so that the interface can't read back the values. The only
 * exception is the valid signal, that is a dedicated register for
 * each request. All request valid signals are also provided in an
 * output.
 * 
 * (c) 2011-2013 by the author(s)
 * 
 * Author(s): 
 *    Stefan Wallentowitz, stefan.wallentowitz@tum.de
 *
 */

`include "lisnoc_dma_def.vh"

module lisnoc_dma_request_table(/*AUTOARG*/
   // Outputs
   ctrl_read_req, valid, done, irq,
   // Inputs
   clk, rst, if_write_req, if_write_pos, if_write_select, if_write_en,
   if_valid_pos, if_valid_set, if_valid_en, if_validrd_en,
   ctrl_read_pos, ctrl_done_pos, ctrl_done_en
   );

   parameter table_entries = 4;
//   localparam table_entries_ptrwidth = $clog2(table_entries);
   localparam table_entries_ptrwidth = 2;

   parameter generate_interrupt = 1;
   
   input clk, rst;

   // Interface write (request) interface
   input [`DMA_REQUEST_WIDTH-1:0]     if_write_req;
   input [table_entries_ptrwidth-1:0] if_write_pos;
   input [`DMA_REQMASK_WIDTH-1:0]     if_write_select;
   input                              if_write_en;
   
   input [table_entries_ptrwidth-1:0] if_valid_pos;
   input                              if_valid_set;
   input                              if_valid_en;
   input                              if_validrd_en;
   
   // Control read (request) interface
   output [`DMA_REQUEST_WIDTH-1:0]    ctrl_read_req;
   input [table_entries_ptrwidth-1:0] ctrl_read_pos;
   
   // Control write (status) interface
   input [table_entries_ptrwidth-1:0] ctrl_done_pos;
   input                              ctrl_done_en;
   
   // All valid bits of the entries
   output [table_entries-1:0]         valid;
   output [table_entries-1:0]         done;

   output [table_entries-1:0] 	      irq;
   
   // The storage of the requests ..
   reg [`DMA_REQUEST_WIDTH-1:0] transfer_request_table[0:table_entries-1];
   
   reg [table_entries-1:0]      transfer_valid;
   reg [table_entries-1:0]      transfer_done;
      
   wire [`DMA_REQUEST_WIDTH-1:0] if_write_mask;
   assign if_write_mask[`DMA_REQFIELD_LADDR_MSB:`DMA_REQFIELD_LADDR_LSB] = {`DMA_REQFIELD_LADDR_WIDTH{if_write_select[`DMA_REQMASK_LADDR]}};
   assign if_write_mask[`DMA_REQFIELD_SIZE_MSB:`DMA_REQFIELD_SIZE_LSB] = {`DMA_REQFIELD_SIZE_WIDTH{if_write_select[`DMA_REQMASK_SIZE]}};
   assign if_write_mask[`DMA_REQFIELD_RTILE_MSB:`DMA_REQFIELD_RTILE_LSB] = {`DMA_REQFIELD_RTILE_WIDTH{if_write_select[`DMA_REQMASK_RTILE]}};
   assign if_write_mask[`DMA_REQFIELD_RADDR_MSB:`DMA_REQFIELD_RADDR_LSB] = {`DMA_REQFIELD_RADDR_WIDTH{if_write_select[`DMA_REQMASK_RADDR]}};
   assign if_write_mask[`DMA_REQFIELD_DIR] = if_write_select[`DMA_REQMASK_DIR];
   
   // Write to the request table
   always @(posedge clk) begin : proc_request_table
      integer i;
      if (rst) begin : reset
         //reset
         for (i = 0; i < table_entries; i = i+1) begin
            { transfer_valid[i], transfer_done[i] } <= 2'b00;
         end //for 
      end else begin
         if (if_write_en) begin
            transfer_request_table[if_write_pos] <= (~if_write_mask & transfer_request_table[if_write_pos]) | (if_write_mask & if_write_req);
         end

         for (i = 0; i<table_entries; i=i+1 ) begin
            if (if_valid_en && (if_valid_pos == i)) begin
               // Start transfer
               transfer_valid[i] <= if_valid_set;
               transfer_done[i] <= 1'b0;
            end else if (if_validrd_en && (if_valid_pos==i) && (transfer_done[i])) begin
               // Check transfer and was done
               transfer_done[i] <= 1'b0;
               transfer_valid[i] <= 1'b0;
            end else if (ctrl_done_en && (ctrl_done_pos==i)) begin
               // Transfer is finished
               transfer_done[i] <= 1'b1;
            end
         end
      end
   end
   
   // Read interface to the request table
   assign ctrl_read_req = transfer_request_table[ctrl_read_pos];
   
   // Combine the valid and done bits to one signal
   genvar i;
   generate
      for (i=0;i<table_entries;i=i+1) begin
         assign valid[i] = transfer_valid[i] & ~transfer_done[i];
         assign done[i] = transfer_done[i];
      end
   endgenerate

   // The interrupt is set when any request is valid and done
   assign irq = (transfer_valid & transfer_done) & {(table_entries){1'b1}};
   
endmodule // dma_transfer_table

// Local Variables:
// verilog-typedef-regexp:"_t$" 
// End:
