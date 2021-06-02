module vga_sync(h_count,v_count,h_sync,v_sync, video_on, x_loc,y_loc);
  input [9:0] h_count;
  input [9:0] v_count;
  output h_sync;
  output v_sync;
  output video_on;
  output [9:0] x_loc;
  output [9:0] y_loc;
  //horizontal
  
  localparam HD = 640;
  localparam HB = 48;
  localparam HF = 16;
  localparam HR = 96;
  
  //vertical
  localparam VD = 480;
  localparam VB = 33;
  localparam VF = 10;
  localparam VR = 2;
  
  assign h_sync = ((h_count < HD+HF)|( h_count > HD+HF+HR));
  assign v_sync = ((v_count < VD+VF) | (v_count >= VD+VF+VR));
  assign video_on = (v_count < VD) & (h_count < HD);
  assign x_loc = h_count;
  assign y_loc = v_count;
  
  
  
endmodule 