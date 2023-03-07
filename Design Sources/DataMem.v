`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name:        Alex Boshnakov
// Date:        12/16/22
// Lab:         Final Project
// Description: This is the Data Memory module of the program
//////////////////////////////////////////////////////////////////////////////////


module DataMem(
    input [31:0] mr, // input mr, 32 bits
    input [31:0] mqb, // input mqb, 32 bits
    input mwmem, // input mwmem, 1 bit
    input clock, // input clock, 1 bit
    
    output reg [31:0] mdo // output mdo, 32 bits
);
    
    reg [31:0] mem [0:63];
    
    // initializing the first 10 words of the data memory with hex values
    initial
    begin
        mem[0] = 32'hA00000AA;
        mem[1] = 32'h10000011;
        mem[2] = 32'h20000022;
        mem[3] = 32'h30000033;
        mem[4] = 32'h40000044;
        mem[5] = 32'h50000055;
        mem[6] = 32'h60000066;
        mem[7] = 32'h70000077;
        mem[8] = 32'h80000088;
        mem[9] = 32'h90000099;
    end
    
    always @(*)
    begin
        mdo = mem[mr[7:2]]; // the value of memory array at location mr is assigned to output
    end
    
    always @(negedge clock)
    begin
        if (mwmem) mem[mr[7:2]] = mqb;
    end
    
endmodule
