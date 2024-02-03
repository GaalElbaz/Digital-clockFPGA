`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: debounce
// Description: 
// Mechanical switches/ buttons cause an unpredictable bounce in the signal when toggled.
// When a button on FPGA is pressed and released, there are many unexpected up-and-down bounces in the push-button signal.
// The debouncing circuit only generates a single pulse with a period of the slow clock without bouncing as we expected. 
//////////////////////////////////////////////////////////////////////////////////


module debounce(
    input clk_in,
    input button_in,
    output led
    );
    
    reg Clr = 1'b0;
    wire slow_clk, Q1,Q1bar,Q2,Q2bar;
    // Instantition
    slow_clock U0(.clk_in(clk_in), .clk_out(slow_clk));
    DFF_Test U1(.D(button_in), .Clk(slow_clk), .Clr(Clr), .Q(Q1), .Qbar(Q1bar));
    DFF_Test U2(.D(Q1), .Clk(slow_clk), .Clr(Clr), .Q(Q2), .Qbar(Q2bar));
    
    assign led = Q2bar & Q1;
endmodule
