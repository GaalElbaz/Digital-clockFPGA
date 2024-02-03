`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: seg_driver
//////////////////////////////////////////////////////////////////////////////////


module seg_driver(
    input clr,
    input clk,
    input [3:0] in1,
    input [3:0] in2,
    input [3:0] in3,
    input [3:0] in4,
    output logic [6:0] seg,
    output logic [3:0] an
    );
    
    localparam LEFT = 2'b00, MIDLEFT = 2'b01, MIDRIGHT = 2'b10, RIGHT = 2'b11;
    
    logic [6:0] seg1,seg2,seg3,seg4;
    logic [12:0] segclk = 0; // for turning segment displays one by one on the board
    logic [1:0] state = LEFT;
    
    // need to change it to segclk[12]
    always_ff @(posedge clk) begin
        segclk = segclk + 1'b1;
        if(segclk[12] == 1'b1) begin 
            segclk <= 0;
            end
    end
    
    always_ff @ (posedge segclk[3] or posedge clr) begin
        if(clr) begin
            seg = 7'b0000000;
            an = 4'b0000;
            state = LEFT;
        end
        else begin
            case(state)
                LEFT: begin
                    seg <= seg1;
                    an = 4'b0111;
                    state <= MIDLEFT;
                end
                MIDLEFT: begin
                    seg <= seg2;
                    an = 4'b1011;
                    state <= MIDRIGHT;
                end
                MIDRIGHT: begin
                    seg <= seg3;
                    an = 4'b1101;
                    state <= RIGHT;
                end
                RIGHT: begin
                    seg <= seg4;
                    an = 4'b1110;
                    state <= LEFT;
                end
            endcase
        end
    end
    
    seven_seg_decoder U1(.in(in1), .disp(seg1));
    seven_seg_decoder U2(.in(in2), .disp(seg2));
    seven_seg_decoder U3(.in(in3), .disp(seg3));
    seven_seg_decoder U4(.in(in4), .disp(seg4));
    
endmodule
