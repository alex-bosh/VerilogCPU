`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name:        Alex Boshnakov
// Date:        12/16/22
// Lab:         Final Project
// Description: This is the Regrt multiplexer module of the program
//////////////////////////////////////////////////////////////////////////////////


module RegrtMUX(
    input [4:0] rt, // input rt, 5 bits (20:16 of dinstOut)
    input [4:0] rd, // input rd, 5 bits (15:11 of dinstOut)
    input regrt, // input regrt, 1 bit
    
    output reg [4:0] destReg // output destReg, 5 bits
);
    always @(*)
    begin
        if (regrt == 1'b0) // if regrt = 0, then use rd for output
            destReg <= rd;
        else                    // if regrt = 1, then use rt for output
            destReg <= rt;
    end
    
endmodule
