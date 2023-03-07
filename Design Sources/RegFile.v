`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name:        Alex Boshnakov
// Date:        12/16/22
// Lab:         Final Project
// Description: This is the Register File module of the program
//////////////////////////////////////////////////////////////////////////////////


module RegFile(
    input [4:0] rs, // input rt, 5 bits (25:21 of dinstOut)
    input [4:0] rt, // input rd, 5 bits (20:16 of dinstOut)
    input [4:0] wdestReg, // input wdestReg, 5 bits
    input [31:0] wbData, // input wbData, 32 bits
    input wwreg, // input wwreg, 1 bit
    input clock, // clock input, 1 bit
    
    output reg [31:0] qa, // output qa, 32 bits
    output reg [31:0] qb // output qb, 32 bits
);

    reg [31:0] registers [0:31];

    initial
    begin
        registers[0] <= 32'h00000000;
        registers[1] <= 32'hA00000AA;
        registers[2] <= 32'h10000011;
        registers[3] <= 32'h20000022;
        registers[4] <= 32'h30000033;
        registers[5] <= 32'h40000044;
        registers[6] <= 32'h50000055;
        registers[7] <= 32'h60000066;
        registers[8] <= 32'h70000077;
        registers[9] <= 32'h80000088;
        registers[10] <= 32'h90000099;
        registers[11] <= 0;
        registers[12] <= 0;
        registers[13] <= 0;
        registers[14] <= 0;
        registers[15] <= 0;
        registers[16] <= 0;
        registers[17] <= 0;
        registers[18] <= 0;
        registers[19] <= 0;
        registers[20] <= 0;
        registers[21] <= 0;
        registers[22] <= 0;
        registers[23] <= 0;
        registers[24] <= 0;
        registers[25] <= 0;
        registers[26] <= 0;
        registers[27] <= 0;
        registers[28] <= 0;
        registers[29] <= 0;
        registers[30] <= 0;
        registers[31] <= 0;
    end

    always @(negedge clock)
    begin
        qa <= registers[rs];
        qb <= registers[rt];
    end
    
    always @(*)
    begin
        if (wwreg)
        begin
            registers[wdestReg] <= wbData;
        end

    end
    
endmodule
