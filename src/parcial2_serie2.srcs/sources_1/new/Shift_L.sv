`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2025 08:36:40 PM
// Design Name: 
// Module Name: Shift_L
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


module Shift_L #(parameter N = 9)(
    input logic [N-1:0] A,
    input logic [2:0] shift,
    output logic [N-1:0] Y
);
    assign Y = A << shift;
endmodule
