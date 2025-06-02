`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2025 08:38:06 PM
// Design Name: 
// Module Name: Sumador_Brent
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


module Sumador_Brent #(parameter N = 9)(
    input logic [N-1:0] A,
    input logic [N-1:0] B,
    input logic Cin,
    output logic [N-1:0] S,
    output logic Cout
);
    assign {Cout, S} = A + B + Cin;
endmodule

