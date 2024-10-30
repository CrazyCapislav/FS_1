`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2024 15:29:31
// Design Name: 
// Module Name: 4comparator
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

module comparator1(
    input a,
    input b,
    output f1,
    output f2,
    output f3
    );
    
    wire not_a, not_b, y1, y2, y3;
    nand(not_a, a, a);
    nand(not_b, b, b);
    
    nand(y1, not_b, a);
    nand(y2, not_a, b);
    
    nand(y3, y1, y2);
    nand(f1, y1, y1);
    nand(f2, y2, y2);
    nand(f3, y3, y3);
endmodule

module comparator4(
    input a1,
    input a2,
    input a3,
    input a4,
    input b1,
    input b2,
    input b3,
    input b4,
    output f1,
    output f2,
    output f3
);
    wire f1_1, f2_1, f3_1;
    wire f1_2, f2_2, f3_2;
    wire f1_3, f2_3, f3_3;
    wire f1_4, f2_4, f3_4;
    wire y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12;
    wire not_y1, not_y2, not_y3, not_y4, not_y5, not_y6, not_y7, not_y9, not_y10, not_y11,  not_y12;
    

    comparator1 comparator1_inst1 (
        .a(a1),
        .b(b1),
        .f1(f1_1),
        .f2(f2_1),
        .f3(f3_1)
    );

    comparator1 comparator1_inst2 (
        .a(a2),
        .b(b2),
        .f1(f1_2),
        .f2(f2_2),
        .f3(f3_2)
    );

    comparator1 comparator1_inst3 (
        .a(a3),
        .b(b3),
        .f1(f1_3),
        .f2(f2_3),
        .f3(f3_3)
    );

    comparator1 comparator1_inst4 (
        .a(a4),
        .b(b4),
        .f1(f1_4),
        .f2(f2_4),
        .f3(f3_4)
    );
    nand(y1, f3_1, f3_2);
    nand(y2, f1_3, f3_4);
    nand(y3, f3_3, f3_4);
    nand(not_y1, y1, y1);
    nand(not_y2, y2, y2);
    nand(not_y3, y3, y3);
    nand(y4, f1_2, not_y3);
    nand(not_y4, y4, y4);
    nand(y5, not_y1, not_y3);
    nand(not_y5, y5, y5);
    nand(f3, y5, y5);
    nand(y6, not_y3, f3_2);
    nand(not_y6, y6, y6);
    nand(y7, not_y6, f1_1);
    nand(not_y7, y7, y7);
    nand(y8, f1_4, f1_4);
    nand(y9, y7, y8);
    nand(not_y9, y9, y9);
    nand(y10, y2, y4);
    nand(not_y10, y10, y10);
    nand(y11, not_y10, not_y9);
    nand(not_y11, y11, y11);
    nand(f1, not_y10, not_y9);
    nand(y12, not_y11, y5);
    nand(f2, y12, y12);
    

    
endmodule
