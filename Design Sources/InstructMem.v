`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name:        Alex Boshnakov
// Date:        12/16/22
// Lab:         Final Project
// Description: This is the Instruction Memory module of the program
//////////////////////////////////////////////////////////////////////////////////


module InstructMem(
    input [31:0] pc, // input pc, 32 bits
    
    output reg [31:0] instOut // output instOut, 32 bits
);
    
    reg [31:0] mem [0:63];
    
    initial
    begin

        mem[25] = 32'b00000000001000100001100000100000; // add $3, $1, $2
        mem[26] = 32'b00000001001000110010000000100010; // sub $4, $9, $3
        mem[27] = 32'b00000000011010010010100000100101; // or $5, $3, $9
        mem[28] = 32'b00000000011010010011000000100110; // xor $6, $3, $9
        mem[29] = 32'b00000000011010010011100000100100; // and $7, $3, $9

    end
    
    always @(*)
    begin
        instOut = mem[pc[7:2]]; // the value of memory array at location pc is assigned to output
    end
    
endmodule
