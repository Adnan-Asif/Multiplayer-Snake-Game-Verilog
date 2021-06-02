module h_counter(clk, h_count, trig_v); 
  
  input clk;
  output [9:0] h_count;
  reg [9:0] h_count;
  output trig_v;
  reg trig_v;
  initial h_count = 0;
  
  always @ (posedge clk)
    
    begin 
      if (h_count < 799)
        begin
          trig_v <= 1'b0;
          h_count<=h_count+1;
        end
      else if (trig_v ==1'b1)
            begin
              trig_v = 1'b0;
              h_count<=0;
            end
      else if (h_count == 799)
            begin
              trig_v = 1'b1;
            end
      else 
        begin 
          trig_v <= 1'b0;
          h_count<= 0;
        end
    end
endmodule

          
module v_counter(clk, v_count, enable_v);
  
  input clk;
  input enable_v;
  output [9:0] v_count;
  reg [9:0] v_count;
  initial v_count = 0;
  
  always @ (posedge clk)
    
    begin 
      if (enable_v==1)
        begin 
          if (v_count == 524)
            begin
              v_count<=0;
            end
          
          else
            begin
             v_count <= v_count +1;
            end
        end 
    end
endmodule       
          
          
module hv_count (clk, h_count, v_count);
  
  input clk;
  wire  clk_d, trig_v;
  output [9:0] v_count;
  output [9:0] h_count;
  
  clk_div g1(.clk(clk), .clk_d(clk_d));
  h_counter g2(.clk(clk_d), .h_count(h_count), .trig_v(trig_v));
  v_counter g3(.clk(clk_d), .v_count(v_count), .enable_v(trig_v));
  
endmodule 