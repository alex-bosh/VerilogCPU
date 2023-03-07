`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name:        Alex Boshnakov
// Date:        12/16/22
// Lab:         Final Project
// Description: This is the Immediate Extender module of the program
//////////////////////////////////////////////////////////////////////////////////


module ImmedExt(
    input [15:0] imm, // input imm, 16 bits  
    
    output reg [31:0] imm32 // output imm32, 32 bits
);

    always @(*)
    begin
        if (imm[15] == 1'b1) // sign extension
            imm32 <= {16'b1111111111111111, imm}; // 1's-extension
        else
            imm32 <= {16'b0000000000000000, imm}; // 0's-extension
    end
    
endmodule
