module gate_combo_1_c (e, f, a, b, c, d);
    input a, b, c, d;
    output e, f;
    wire x, y, z;

    // assign the operations of combining signals directly
    assign x = ~a;
    assign y = a & b;
    assign z = y | c;
    assign e = x | z;
    assign f = ~(z & d);

endmodule