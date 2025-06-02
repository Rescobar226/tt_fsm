`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2025 08:30:59 PM
// Design Name: 
// Module Name: AM_AB
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


module AM_AB #(parameter N = 9)(
    input logic [N-1:0] A,
    input logic [N-1:0] B,
    input logic sel,
    output logic [N-1:0] Y
);
    assign Y = (sel == 1'b0) ? A : B;
endmodule
