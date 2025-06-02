`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2025 08:35:43 PM
// Design Name: 
// Module Name: Flags
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


module Flags #(parameter N = 9)(
    input logic [N-1:0] result,
    input logic carry_out,
    input logic overflow,
    output logic zero,
    output logic sign,
    output logic carry_flag,
    output logic overflow_flag
);
    assign zero = (result == 0);
    assign sign = result[N-1];
    assign carry_flag = carry_out;
    assign overflow_flag = overflow;
endmodule

