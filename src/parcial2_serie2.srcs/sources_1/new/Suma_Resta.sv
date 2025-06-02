`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2025 08:34:48 PM
// Design Name: 
// Module Name: Suma_Resta
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


module Suma_Resta #(parameter N = 9)(
    input logic [N-1:0] A,
    input logic [N-1:0] B,
    input logic sel, // 0: Suma, 1: Resta
    output logic [N-1:0] S,
    output logic carry_out
);
    logic [N-1:0] B_in;
    logic c_in;

    assign B_in = sel ? ~B : B;
    assign c_in = sel;
    assign {carry_out, S} = A + B_in + c_in;
endmodule


