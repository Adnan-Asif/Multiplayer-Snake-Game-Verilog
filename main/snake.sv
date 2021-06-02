`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2020 01:10:40 PM
// Design Name: 
// Module Name: snake
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "KB_input.sv"
`include "vga_sync.sv"
`include "clk_div.sv"
`include "UpdateClock.sv" 
`include "snaketop.sv"
`include "hv_count.sv"
`include "move.sv"
`include "inp.sv"

module vga_controller(clk,K_clk,data,U,D,L,R, h_sync, v_sync, red, green, blue);
  input clk;
  input K_clk;
  input data;
  input  U,L,D,R;
  output h_sync;
  output v_sync;
  output reg [3:0] red;
  output reg [3:0] green;
  output reg [3:0] blue;
  wire [9:0] h_count;
  wire [9:0] v_count;
  logic clk_d;
  wire [4:0] dir;
  logic [4:0] state_snake1;
  logic [4:0] state_snake2;
  //wire [4:0] dir2;
  logic [4:0] dir2;
  wire video_on;
  wire [9:0] x_loc;
  wire [9:0] y_loc;
  
  initial state_snake1 = 5'b10000;
  initial state_snake2 = 5'b10000;
  
  hv_count g1(clk, h_count, v_count);
  vga_sync g2(h_count, v_count, h_sync, v_sync, video_on, x_loc, y_loc);
  clk_div g4 (clk, clk_d);
  UpdateClock upd(clk, clk_u);
  KB_input kb(K_clk, data, dir);
  move mv1(clk_d, dir, state_snake1);
  inp ip(clk_d,U,D,R,L, dir2);
  move mv2(clk_d,dir2, state_snake2);
  snaketop g3(clk_d, clk_u, state_snake1,state_snake2, x_loc, y_loc, video_on, red, green, blue);
  
endmodule