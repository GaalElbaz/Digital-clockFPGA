`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: digital_clk_TB
//////////////////////////////////////////////////////////////////////////////////


module digital_clk_TB(
    );
    
    logic clk, sw, btnC, btnU, btnR;
    logic [6:0] seg;
    logic [3:0] an;   
    logic [10:0] led;
    
    top_module inst (.clk(clk), .sw(sw), .btnC(btnC), .btnU(btnU), .btnR(btnR), .seg(seg), .an(an), .led(led));
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 1'b0;
        btnC = 1'b1;
        #10
        btnC = 1'b0;
        sw = 1'b1;
        #1000
        $finish;
    end
endmodule
