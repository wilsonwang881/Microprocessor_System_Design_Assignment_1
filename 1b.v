module nand (c, a, b);
    input a, b;
    output c;
    wire x;

    and AND (x, a, b);
    not NOT (c, x);

endmodule

module gate_combo_1_b (e, f, a, b, c, d);
    input a, b, c, d;
    output e, f;
    wire x, y, z, f_aux;
    
    // instantiate gate instances with proper connecti
    not NOT2 (x, a);
    and AND2 (y, a, b);
    or OR2 (z, y, c);
    or OR1 (e, x, z);
    nand NAND2 (f, z, d);

endmodule