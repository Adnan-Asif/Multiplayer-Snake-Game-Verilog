`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.12.2020 15:03:22
// Design Name: 
// Module Name: move
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


module move(clk, dir, state);
  input clk; 
  input [4:0] dir; 
  output [4:0] state;
  reg [4:0] state;  
  reg [4:0] next; 

  
  parameter UP = 5'b00010; 
  parameter LEFT = 5'b00100; 
  parameter RIGHT = 5'b10000; 
  parameter DOWN = 5'b01000;  
  parameter START = 5'b0;
  parameter RESET = 5'b11111;
  

  always @(dir)
    begin 
      case (state) 
        UP:
          begin
            if (dir == 5'b00010)
            next = UP; 
            else if (dir == 5'b00100)
              next = LEFT; 
            else if (dir == 5'b10000)
              next = RIGHT; 
            else if (dir == 5'b01000)
              next = UP; //Since it can't go down when it's up
            else if (dir == 5'b11111)
                next = RESET;
          end 
        RIGHT:
          begin
            if (dir == 5'b00010)
            next = UP; 
            else if (dir == 5'b00100)
              next = RIGHT; //Since it can't go left when it's right
            else if (dir == 5'b10000)
              next = RIGHT; 
            else if (dir == 5'b01000)
              next = DOWN; 
            else if (dir == 5'b11111)
                next = RESET;
          end 
        LEFT:
          begin
            if (dir == 5'b00010)
            next = UP; 
            else if (dir == 5'b00100)
              next = LEFT; 
            else if (dir == 5'b10000)
              next = RIGHT; //Since it can't go right when it's left
            else if (dir == 5'b01000)
              next = DOWN; 
            else if (dir == 5'b11111)
                next = RESET;
          end  
        DOWN:
          begin
            if (dir == 5'b00010)
            next = DOWN; //Since it can't go up when it's down
            else if (dir == 5'b00100)
              next = LEFT; 
            else if (dir == 5'b10000)
              next = RIGHT; 
            else if (dir == 5'b01000)
              next = DOWN; 
            else if (dir == 5'b11111)
                next = RESET;
          end 
          START:
          begin
            if (dir == 5'b00010)
            next = UP; 
            else if (dir == 5'b00100)
              next = LEFT; 
            else if (dir == 5'b10000)
              next = RIGHT; 
            else if (dir == 5'b01000)
              next = DOWN; 
            else if (dir == 5'b11111)
                next = RESET;
          end  
          RESET:
          begin
            next=UP;
          end
        default:
          next = START; 
      endcase 
      state = next ;
    end 
endmodule
//   always @(dir)
//   begin
//      if (state==UP)
//          begin
//            if (dir == 5'b00010)
//            next = UP; 
//            else if (dir == 5'b00100)
//              next = LEFT; 
//            else if (dir == 5'b10000)
//              next = RIGHT; 
//            else if (dir == 5'b01000)
//              next = UP; //Since it can't go down when it's up
//          end 
//      else  if (state==RIGHT)
//          begin
//            if (dir == 5'b00010)
//            next = UP; 
//            else if (dir == 5'b00100)
//              next = RIGHT; //Since it can't go left when it's right
//            else if (dir == 5'b10000)
//              next = RIGHT; 
//            else if (dir == 5'b01000)
//              next = DOWN; 
//          end 
//       else if (state == LEFT)
//          begin
//            if (dir == 5'b00010)
//            next = UP; 
//            else if (dir == 5'b00100)
//              next = LEFT; 
//            else if (dir == 5'b10000)
//              next = LEFT; //Since it can't go right when it's left
//            else if (dir == 5'b01000)
//              next = DOWN; 
//          end  
//      else if (state == DOWN)
//          begin
//            if (dir == 5'b00010)
//            next = DOWN; 
//            else if (dir == 5'b00100)
//              next = LEFT; 
//            else if (dir == 5'b10000)
//              next = RIGHT; 
//            else if (dir == 5'b01000)
//              next = DOWN; 
//          end 
//         else if (state == START)
//          begin
//            if (dir == 5'b00010)
//            next = UP; 
//            else if (dir == 5'b00100)
//              next = LEFT; 
//            else if (dir == 5'b10000)
//              next = RIGHT; 
//            else if (dir == 5'b01000)
//              next = DOWN; 
//          end  
//        else
//          next = START; 

//          state=next;
//   end
   
//endmodule
//        else if (state == START)
//          begin
//            if (dir == 5'b00010)
//            next = UP; 
//            else if (dir == 5'b00100)
//              next = LEFT; 
//            else if (dir == 5'b10000)
//              next = RIGHT; 
//            else if (dir == 5'b01000)
//              next = DOWN; 
//          end  
//        else
//          next = START; 

//      state = next ;
//    end
   
//endmodule