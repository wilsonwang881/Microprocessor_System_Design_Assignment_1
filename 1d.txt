module gate_combo_1_d (e, f, a, b, c, d);
    input a, b, c, d;
    output e, f;
    reg x, y, z, e, f;
    
    // use an always block to detect changes and update
    always @ (a or b or c or d)
    begin
        x <= ~a;
        y <= a & b;
        z <= y | c;
        e <= x | z;
        f <= ~(z & d);
    end

endmodule