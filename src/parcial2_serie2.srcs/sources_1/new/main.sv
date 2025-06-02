`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2025 08:38:43 PM
// Design Name: 
// Module Name: main
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module main #(parameter N = 9)(
    input logic [N-1:0] A,
    input logic [N-1:0] B,
    input logic [2:0] ALUControl,
    input logic [2:0] ShiftAmt,
    output logic [N-1:0] Result,
    output logic zero,
    output logic sign,
    output logic carry_flag,
    output logic overflow_flag
);
    logic [N-1:0] sumres_out, shift_out;
    logic carry_out, overflow;

    // ALU Operations
    Suma_Resta #(N) arith (.A(A), .B(B), .sel(ALUControl[0]), .S(sumres_out), .carry_out(carry_out));
    Shift_L #(N) shl (.A(A), .shift(ShiftAmt), .Y(shift_out));

    always_comb begin
        case (ALUControl)
            3'b000: Result = sumres_out; // Suma
            3'b001: Result = sumres_out; // Resta
            3'b010: Result = shift_out;  // Shift Left
            3'b011: Result = A >> ShiftAmt; // Shift Right
            3'b100: Result = A & B;
            3'b101: Result = A | B;
            default: Result = '0;
        endcase
    end

    assign overflow = (A[N-1] == B[N-1]) && (Result[N-1] != A[N-1]);
    Flags #(N) flg (.result(Result), .carry_out(carry_out), .overflow(overflow),
                   .zero(zero), .sign(sign), .carry_flag(carry_flag), .overflow_flag(overflow_flag));
endmodule

