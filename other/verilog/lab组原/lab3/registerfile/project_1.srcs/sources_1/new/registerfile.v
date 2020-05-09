`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/12 16:31:18
// Design Name: 
// Module Name: registerfile
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


module registerfile#(parameter m=3,n=4)(
    input [m-1:0] read1,read2,write1,
    input [n-1:0] writedata,
    input regwrite,clk,
    output [n-1:0] data1,data2
    );
    reg [n-1:0] rf [7:0];
    
    assign data1 = rf[read1];
    assign data2 = rf[read2];
    always@(posedge clk)
    begin
        if(regwrite) rf[write1] <= writedata;
    end
    
endmodule
