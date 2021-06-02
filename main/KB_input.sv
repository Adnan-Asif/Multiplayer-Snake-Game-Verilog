`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2020 01:14:37 PM
// Design Name: 
// Module Name: KB_input
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


module KB_input(KB_clk, data, direction);

input KB_clk, data;
output reg [4:0] direction; 
reg [7:0] code;
reg [10:0]keyCode, previousCode;
integer count = 0;

always@(negedge KB_clk)
begin
keyCode[count] = data;
count = count + 1; 
if(count == 11)
begin
if(previousCode == 8'hF0)
begin
code <= keyCode[8:1];
end
previousCode = keyCode[8:1];
count = 0;
end
end

always@(code)
begin
//if(code == 8'h1D) //up
if(code == 8'hE075) //up
direction = 5'b00010;
//else if(code == 8'h1C) //left
else if(code == 8'hE06B) //left
direction = 5'b00100;
//else if(code == 8'h1B) //down
else if(code == 8'hE072) //down
direction = 5'b01000;
//else if(code == 8'h23) //right
else if(code == 8'hE074) //right
    direction = 5'b10000;

else if(code == 8'h5A) //reset
     direction = 5'b11111;

else direction <= direction;


end 
endmodule
