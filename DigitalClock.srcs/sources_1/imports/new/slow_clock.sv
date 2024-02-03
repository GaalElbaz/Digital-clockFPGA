`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: slow_clock
// Description: 
// The basys 3 board has a clock frequency of 100MHz.
// In order to convert the freq of the clock we will use a counter which will help to create the clk_out
//////////////////////////////////////////////////////////////////////////////////


module slow_clock(
    input clk_in,        // input clk of basys 3 board
    output logic clk_out // freq of 4Hz slow clk
    );
    
    // To convert 100Mhz to 4hz -> 100M/4 -> 25,000,000 Cycles -> divide by 2 for negative and positive edges.
    localparam int MAXVALUE = 8'd12500000;
   
    logic [25:0] count = 0;
    
    always_ff @(posedge clk_in) begin
        if(count == MAXVALUE) begin
            count <= 0;
            clk_out <= ~clk_out;
        end
        else count <= count + 1'd1;
    end
endmodule
