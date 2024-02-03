`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Module Name: seven_seg_decoder
//////////////////////////////////////////////////////////////////////////////////


module seven_seg_decoder(
    input [3:0] in,
    output logic [6:0] disp
    );
    
    // active low logic that displays the line (a,b,c,d,e,f,g)
    always_comb begin
        case(in)
            0: disp = 7'b0000001;  
            1: disp = 7'b1001111; 
            2: disp = 7'b0010010;
            3: disp = 7'b0000110;
            4: disp = 7'b1001100;
            5: disp = 7'b0100100;
            6: disp = 7'b0100000;
            7: disp = 7'b0001111;
            8: disp = 7'b0000000;
            9: disp = 7'b0001100;
        endcase
    end
endmodule
