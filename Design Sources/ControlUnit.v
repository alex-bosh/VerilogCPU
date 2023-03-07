`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name:        Alex Boshnakov
// Date:        12/16/22
// Lab:         Final Project
// Description: This is the Control Unit module of the program
//////////////////////////////////////////////////////////////////////////////////


module ControlUnit(
    input [5:0] op, // input op, 6 bits (31:26 of dinstOut)
    input [5:0] funct, // input funct, 6 bits (5:0 of dinstOut)
    input [4:0] rs, // input rs, 5 bits (25:21 of dinstOut)
    input [4:0] rt, // input rt, 5 bits (20:16 of dinstOut)
    input [4:0] mdestReg, // input mdestReg, 5 bits
    input mm2reg, // input mm2reg, 1 bit
    input mwreg, // input mwreg, 1 bit
    input [4:0] edestReg, // input edestReg, 5 bits
    input em2reg, // input em2reg, 1 bit
    input ewreg, // input ewreg, 1 bit
    
    output reg wreg, // output wreg, write register
    output reg m2reg, // output m2reg, memory to register
    output reg wmem, // output wmem, write memory
    output reg [3:0] aluc, // output aluc, ALU control
    output reg aluimm, // output aluimm, ALU immediate
    output reg regrt, // output regrt, register rt
    output reg [1:0] fwda, // output fwda, 2 bits
    output reg [1:0] fwdb // output fwdb, 2 bits
);
    
    initial
    begin
        fwda = 2'b00;
        fwdb = 2'b00;
    end

    always @(op, funct)
    begin
        case (op)
            6'b000000: // r-types
            begin
                case (funct)
                    6'b100000: // ADD instruction
                    begin
                        wreg = 1'b1;
                        m2reg = 1'b0;
                        wmem = 1'b0;
                        aluc = 4'b0010;
                        aluimm = 1'b0;
                        regrt = 1'b0;
                    end
                    6'b100010: // SUB instruction
                    begin
                        wreg = 1'b1;
                        m2reg = 1'b0;
                        wmem = 1'b0;
                        aluc = 4'b0110;
                        aluimm = 1'b0;
                        regrt = 1'b0;
                    end
                    6'b100101: // OR instruction
                    begin
                        wreg = 1'b1;
                        m2reg = 1'b0;
                        wmem = 1'b0;
                        aluc = 4'b0001;
                        aluimm = 1'b0;
                        regrt = 1'b0;
                    end
                    6'b100100: // AND instruction
                    begin
                        wreg = 1'b1;
                        m2reg = 1'b0;
                        wmem = 1'b0;
                        aluc = 4'b0000;
                        aluimm = 1'b0;
                        regrt = 1'b0;
                    end
                    default: // XOR instruction
                    begin
                        wreg = 1'b1;
                        m2reg = 1'b0;
                        wmem = 1'b0;
                        aluc = 4'b1100;
                        aluimm = 1'b0;
                        regrt = 1'b0;
                    end
                endcase
            end
            6'b100011: // LW instruction
            begin
                wreg = 1'b1;
                m2reg = 1'b1;
                wmem = 1'b0;
                aluc = 4'b0010;
                aluimm = 1'b1;
                regrt = 1'b1;
            end
        endcase
    end
    
    always @(rs, rt, mdestReg, mm2reg, mwreg, edestReg, em2reg, ewreg)
    begin
        if (rs == edestReg)
            fwda = 2'b01;
        else if (rs == mdestReg)
            fwda = 2'b10;
        else
            fwda = 2'b00;       
            
    end
    
    always @(rs, rt, mdestReg, mm2reg, mwreg, edestReg, em2reg, ewreg)
    begin
        if (rt == edestReg)
            fwdb = 2'b01;
        else if (rt == mdestReg)
            fwdb = 2'b10;
        else
            fwdb = 2'b00;
            
    end
    
endmodule
