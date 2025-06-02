`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2025 08:37:21 PM
// Design Name: 
// Module Name: Shift_R
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


module Shift_R #(parameter N = 9)(
    input logic [N-1:0] A,
    input logic [2:0] shift,
    output logic [N-1:0] Y
);
    assign Y = A >> shift;
endmodule

