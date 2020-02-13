// count the number of 1s
// output 1 of odd else 0
module operation1 (res, data);
    input [31:0] data;
    output [31:0] res;
    reg counter = 6'b0;

    for (i = 0; i<32; i++)
        counter = counter + data[i]

    res = counter[0] ? 32'b1 : 32'b0 ;

endmodule

// multiply by 15
// without using the multiplication operation
// shift by 4 bits and minus the input
module operation2 (res, data);
    input [31:0] data;
    output [31:0] res;

    res = data <<< 4 - data;

endmodule

// truncate the high-16 bit of the input
module operation3 (res, data);
    input [31:0] data;
    output [31:0] res;

    assign res = data & 32'hffff0000;    

endmodule

// output 1 if input is negeative
// else output 0
module operation4 (res, data);
    input [31:0] data;
    output [31:0] res;

    assign res = data[31] ? 32'b1 : 32'b0;

endmodule

// multiplexer unit
module ALUMux (res, select, data1, data2, data3, data4);
    input [1:0] select
    input [31:0] data1, data2, data3, data4;
    output [31:0] res;
    wire [31:0] resSub1, resSub2;
    
    assign resSub1 = select[0] ? data4 : data3;
    assign resSub2 = select[0] ? data2 : data1;
    assign res = select[1] ? resSub1 : resSub2;

endmodule

// ALU unit
// package all five components into one unit
module Q3ALU (res, select, data);

    input [31:0] data;
    input [1:0] select;
    output [31:0] res;

    wire [31:0] op1, op2, op3, op4;

    operation1 OP1 (op1, data);
    operation2 OP2 (op2, data);
    operation3 OP3 (op3, data);
    operation4 OP4 (op4, data);
    ALUMux MUX (res, select, op1, op2, op3, op4) 

endmodule