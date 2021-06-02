module UpdateClock (input logic clk, output logic update_clk);
 
    logic [21:0] check;
    
    always @ (posedge clk) begin
        if(check < 4000000) begin 
            check <= check + 1;
            update_clk <= 0;
        end
        else begin 
            check <= 0;
            update_clk <= 1;
        end
    end
            
endmodule
