`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2020 13:11:16
// Design Name: 
// Module Name: inp
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


module inp(input clk, input U, input D, input R, input L, output logic [4:0] dir2);
  //reg [4:0] dir2;
 
  always@(posedge clk)
    begin 
    if (R) 
    dir2 = 5'b10000;;
    if (D)
    dir2 = 5'b01000;
    if (L) 
    dir2 = 5'b00100;
    if (U)
    dir2 = 5'b00010;
    end
  endmodule