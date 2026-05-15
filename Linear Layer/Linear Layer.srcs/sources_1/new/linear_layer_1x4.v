`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2026 09:10:24 AM
// Design Name: 
// Module Name: linear_layer_1x4
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


module linear_layer_1x4(
    input wire clk,
    input wire rst,
    input wire valid_input,
    input wire [15:0] data_in,
    input wire [15:0] weight_0,
    input wire [15:0] weight_1,
    input wire [15:0] weight_2,
    input wire [15:0] weight_3,
    output wire [15:0] out_0,
    output wire [15:0] out_1,
    output wire [15:0] out_2,
    output wire [15:0] out_3
    );
    
    neuron_block n0( 
    .clk(clk),
    .rst(rst),
    .valid_input(valid_input),
    .data_in(data_in),   
    .weight(weight_0),   
    .out_logic(out_0)); 
    
    neuron_block n1( 
    .clk(clk),
    .rst(rst),
    .valid_input(valid_input),
    .data_in(data_in),   
    .weight(weight_1),   
    .out_logic(out_1)); 
    
        neuron_block n2( 
    .clk(clk),
    .rst(rst),
    .valid_input(valid_input),
    .data_in(data_in),   
    .weight(weight_2),   
    .out_logic(out_2)); 
    
        neuron_block n3( 
    .clk(clk),
    .rst(rst),
    .valid_input(valid_input),
    .data_in(data_in),   
    .weight(weight_3),   
    .out_logic(out_3));
     
endmodule
