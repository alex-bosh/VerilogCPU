`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name:        Alex Boshnakov
// Date:        12/16/22
// Lab:         Final Project
// Description: This is the ID/EXE Pipeline register module of the program
//////////////////////////////////////////////////////////////////////////////////


module IDEXE(
    input wreg, // input wreg
    input m2reg, // input m2reg
    input wmem, // input wmem
    input [3:0] aluc, // input aluc, 4 bits
    input aluimm, // input aluimm
    input [4:0] destReg, // input destReg, 5 bits
    input [31:0] qa, // input qa, 32 bits
    input [31:0] qb, // input qb, 32 bits
    input [31:0] imm32, // input imm32, 32 bits
    input clock, // clock input
    
    output reg ewreg, // output ewreg
    output reg em2reg, // output em2reg
    output reg ewmem, // output ewmem
    output reg [3:0] ealuc, // output ealuc, 4 bits
    output reg ealuimm, // output ealuimm
    output reg [4:0] edestReg, // output edestReg, 5 bits
    output reg [31:0] eqa, // output eqa, 32 bits
    output reg [31:0] eqb, // output eqb, 32 bits
    output reg [31:0] eimm32 // output eimm32, 32 bits
);
    
    always @(posedge clock)
    begin
        ewreg <= wreg;
        em2reg <= m2reg;
        ewmem <= wmem;
        ealuc <= aluc;
        ealuimm <= aluimm;
        edestReg <= destReg;
        eqa <= qa;
        eqb <= qb;
        eimm32 <= imm32;
    end
    
endmodule
