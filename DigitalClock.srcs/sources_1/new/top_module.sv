`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: top_module
//////////////////////////////////////////////////////////////////////////////////


module top_module(
    input clk,          // basys 3 clk - 100MHz
    input sw,           // switch[0] to enable the clocl
    input btnC,         // Reset the clk
    input btnU,         // hour increment
    input btnR,         // minute increment
    output [6:0] seg,   // HH:MM display
    output [3:0] an,    // digit display
    output [10:0] led    // seconds display
    );
    
    logic [3:0] hours2, hours1;
    logic [3:0] min2, min1, seconds2, seconds1;
    
    
    digital_clock U0(.clk(clk), .en(sw), .rst(btnC), .hrup(btnU), .minup(btnR), .h2(hours2), .h1(hours1), .m2(min2), .m1(min1), .s2(seconds2), .s1(seconds1));
    debounce B1(.clk_in(clk), .button_in(btnC), .led(led[8]));
    debounce B2(.clk_in(clk), .button_in(btnU), .led(led[9]));
    debounce B3(.clk_in(clk), .button_in(btnR), .led(led[10]));
    seg_driver L1(.clr(btnC), .clk(clk), .in1(hours2), .in2(hours1), .in3(min2), .in4(min1), .seg(seg), .an(an));
    
    assign led[3:0] = seconds1;
    assign led[7:4] = seconds2;   
    
endmodule
