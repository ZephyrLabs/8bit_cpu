/**
comparator block
**/
module int8_cmp(a, b, gt, eq);
    input[7:0] a, b;
    output gt, lt, eq;

    assign eq = a==b;
    assign gt = a>=b;
endmodule
