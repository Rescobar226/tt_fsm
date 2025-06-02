`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2025 08:33:55 PM
// Design Name: 
// Module Name: Comparador
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


module Comparador #(parameter N = 9)(
    input logic [N-1:0] A,
    input logic [N-1:0] B,
    output logic EQ,
    output logic LT,
    output logic GT
);
    always_comb begin
        EQ = (A == B);
        LT = (A < B);
        GT = (A > B);
    end
endmodule