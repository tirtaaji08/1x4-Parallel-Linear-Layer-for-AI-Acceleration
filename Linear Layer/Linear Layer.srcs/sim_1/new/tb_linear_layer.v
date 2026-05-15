`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2026 12:25:01 AM
// Design Name: 
// Module Name: tb_linear_layer
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


module tb_linear_layer();

    reg clk;
    reg reset;
    reg valid_in;
    reg [15:0] data_in;
    
    reg [15:0] weight_0;
    reg [15:0] weight_1;
    reg [15:0] weight_2;
    reg [15:0] weight_3;
    
    wire [15:0] out_0;
    wire [15:0] out_1;
    wire [15:0] out_2;
    wire [15:0] out_3;
    
    linear_layer_1x4 uut (
        .clk(clk), .rst(reset), .valid_input(valid_in), .data_in(data_in),
        .weight_0(weight_0), .weight_1(weight_1), .weight_2(weight_2), .weight_3(weight_3),
        .out_0(out_0), .out_1(out_1), .out_2(out_2), .out_3(out_3)
    );
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        valid_in = 0;
        data_in = 0;
        

        // W0 = 1.0, W1 = 0.5, W2 = -1.0, W3 = 2.0
        weight_0 = 16'h0100; 
        weight_1 = 16'h0080; 
        weight_2 = 16'hFF00;
        weight_3 = 16'h0200; 
        reset = 1; #20;
        reset = 0; #10;

        // Ekspektasi Output: N0=2.0, N1=1.0, N2=0 (ReLU), N3=4.0
        data_in = 16'h0200; 
        valid_in = 1;
        #10;
        valid_in = 0;
        #20;

        // Ekspektasi Output: N0=3.0, N1=1.5, N2=0 (ReLU), N3=6.0
        data_in = 16'h0100;
        valid_in = 1;
        #10;
        valid_in = 0;
        #30;

        $display("Simulasi Layer Paralel Selesai.");
        $stop;
    end

endmodule
