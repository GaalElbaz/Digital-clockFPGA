`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: binaryToBcd
//////////////////////////////////////////////////////////////////////////////////


module binaryToDigits(
    input [5:0] binary, 
    output logic [3:0] ones,
    output logic [3:0] tens
    );
    
    
    logic [5:0] bcd_data = 0;
    always_comb begin
        bcd_data = binary;
        ones = bcd_data % 10;
        bcd_data = bcd_data - ones;
        tens = bcd_data / 10;            
    end
endmodule
