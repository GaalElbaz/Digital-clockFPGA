`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: DFF_Test
// 
//////////////////////////////////////////////////////////////////////////////////


module DFF_Test(
    input Clk,
    input Clr,
    input D,
    output logic Q,
    output logic Qbar
    );
    
    always_ff @(posedge Clk or posedge Clr) begin
        if (Clr) begin
            Q <= 1'b0;
            Qbar <= 1'b1;
        end
        else begin
            Q <= D;
            Qbar <= ~D;
        end
    end
endmodule
