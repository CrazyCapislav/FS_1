`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2024 16:45:43
// Design Name: 
// Module Name: compatator4_tb
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


module compatator4_tb;
    reg a1_in, a2_in, a3_in, a4_in, b1_in, b2_in, b3_in, b4_in;
    wire f1_out, f2_out, f3_out;
    
    comparator4 comparator4_1(
        .a1(a1_in),
        .a2(a2_in),
        .a3(a3_in),
        .a4(a4_in),
        .b1(b1_in),
        .b2(b2_in),
        .b3(b3_in),
        .b4(b4_in),
        .f1(f1_out),
        .f2(f2_out),
        .f3(f3_out)
    );
    integer i, j;
    reg [3:0] a_in, b_in;
    reg f1_expected, f2_expected, f3_expected;
    
    initial begin
        // Перебор всех возможных значений для a_in и b_in (от 0 до 15)
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                a_in = i;
                b_in = j;

                // Присваивание значений каждому разряду для a_in
                a1_in = a_in[0];
                a2_in = a_in[1];
                a3_in = a_in[2];
                a4_in = a_in[3];

                // Присваивание значений каждому разряду для b_in
                b1_in = b_in[0];
                b2_in = b_in[1];
                b3_in = b_in[2];
                b4_in = b_in[3];

                // Ожидаемые значения для f1, f2 и f3
                f1_expected = (a_in > b_in);  // Ожидаемый результат для a > b
                f2_expected = (a_in < b_in);  // Ожидаемый результат для a < b
                f3_expected = (a_in == b_in); // Ожидаемый результат для a = b

                #10 // Задержка для стабилизации сигналов

                // Проверка выходных значений и вывод результата
                if (f1_out === f1_expected && f2_out === f2_expected && f3_out === f3_expected) begin
                    $display("Test passed: a_in = %b, b_in = %b, f1 = %b, f2 = %b, f3 = %b",
                             a_in, b_in, f1_out, f2_out, f3_out);
                end else begin
                    $display("Test failed: a_in = %b, b_in = %b, f1_out = %b (expected %b), f2_out = %b (expected %b), f3_out = %b (expected %b)",
                             a_in, b_in, f1_out, f1_expected, f2_out, f2_expected, f3_out, f3_expected);
                end
            end
        end
        
        #10 $stop;
        
    end
endmodule
