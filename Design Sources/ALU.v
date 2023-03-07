`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name:        Alex Boshnakov
// Date:        12/16/22
// Lab:         Final Project
// Description: This is the ALU module of the program
//////////////////////////////////////////////////////////////////////////////////


module ALU(
    input [31:0] eqa, // input eqa, 32 bits
    input [31:0] b, // input b, 32 bits
    input [3:0] ealuc, // input ealuc, 4 bits
    
    output reg [31:0] r // output r, 32 bits
);
    always @(eqa, b, ealuc)
    begin
        case (ealuc)
            4'b0010: // add
            begin
                r = eqa + b;
            end
            4'b0110: // sub
            begin
                r = eqa - b;
            end
            4'b0001: // or
            begin
                r = eqa | b;
            end
            4'b0000: // and
            begin
                r = eqa & b;
            end
            default: // xor
            begin
                r = eqa ^ b;
            end
                
        endcase
    end
    
endmodule
