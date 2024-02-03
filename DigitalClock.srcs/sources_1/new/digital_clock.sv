`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Module Name: digital_clock
// 
//////////////////////////////////////////////////////////////////////////////////


module digital_clock(
    input clk,
    input en,
    input rst,
    input hrup,
    input minup,
    output logic [3:0] h2,
    output logic [3:0] h1,
    output logic [3:0] m1,
    output logic [3:0] m2,
    output logic [3:0] s2,
    output logic [3:0] s1
    );
    
    localparam MAXMIN = 59, MAXHOUR = 23, MAXSEC = 59, ONESEC = 1000_000_000;
    logic [10:0] clkc = 0;
    
    logic [5:0] min, sec; // in order to represent 59 for min and sec
    logic [5:0] hour;     // in order to represent 23 for hour
    always_ff @(posedge clk) begin
        if(rst) begin
            hour = 0;
            min = 0;
            sec = 0;
        end
        if(minup) begin
            if(min == MAXMIN) begin
                min = 0;
                hour = hour + 1'd1;
                if (hour >=  MAXHOUR) begin
                    hour = 0;
                end
            end
            else begin
                min = min + 1'd1;
            end        
        end
        if(hrup) begin
            if(hour == MAXHOUR) begin
                hour = 0;
            end
            else begin
                hour = hour + 1'd1;
            end
        end
        if(en) begin
            if(clkc == ONESEC) begin
                clkc = 0;
                if(sec == MAXSEC) begin
                    sec = 0;
                    if(min == MAXMIN) begin
                        min = 0;
                        if(hour == MAXHOUR) begin
                            hour = 0;
                        end
                        else begin
                            hour = hour + 1'd1;
                        end
                    end
                    else begin
                        min = min + 1'd1;
                    end
                end
                else begin
                    sec = sec + 1'b1;
                end
            end
            clkc = clkc + 1'd1;
        end 
    end
    
    
    binaryToDigits seconds(.binary(sec), .tens(s2), .ones(s1));
    binaryToDigits minutes(.binary(min), .tens(m2), .ones(m1));
    binaryToDigits hours(.binary(hour),  .tens(h2), .ones(h1));
endmodule
