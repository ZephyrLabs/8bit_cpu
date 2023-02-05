`include "../../int8_addsub.v"

module and_array(a, b, c);
    input[7:0] a;
    input b;

    output[7:0] c;
    
    assign c[7:0] = {b, b, b, b, b, b, b, b}&a[7:0];
endmodule

module int8_multiplier(a, b, product);
    input[7:0] a, b;

    output[15:0] product;

    wire[7:0] w0, w1, w2, w3, w4, w5, w6, w7, 
              w8, w9, w10, w11, w12, w13, w14;

    wire[7:0] c;
    wire cin = 0;

    and_array a0(a[7:0], b[0], w0[7:0]);
    assign product[0] = a[0]&b[0];

    and_array a1(a[7:0], b[1], w1[7:0]);
    int8_addsub ias1({cin, w0[7:1]}, w1[7:0], cin, w2[7:0], c[0]);
    assign product[1] = w2[0];

    and_array a2(a[7:0], b[2], w3[7:0]);
    int8_addsub ias2({c[0], w2[7:1]}, w3[7:0], cin, w4[7:0], c[1]);
    assign product[2] = w4[0];

    and_array a3(a[7:0], b[3], w5[7:0]);
    int8_addsub ias3({c[1], w4[7:1]}, w5[7:0], cin, w6[7:0], c[2]);
    assign product[3] = w6[0];

    and_array a4(a[7:0], b[4], w7[7:0]);
    int8_addsub ias4({c[2], w6[7:1]}, w7[7:0], cin, w8[7:0], c[3]);
    assign product[4] = w8[0];

    and_array a5(a[7:0], b[5], w9[7:0]);
    int8_addsub ias5({c[3], w8[7:1]}, w9[7:0], cin, w10[7:0], c[4]);
    assign product[5] = w10[0];

    and_array a6(a[7:0], b[6], w11[7:0]);
    int8_addsub ias6({c[4], w10[7:1]}, w11[7:0], cin, w12[7:0], c[5]);
    assign product[6] = w12[0];

    and_array a7(a[7:0], b[7], w13[7:0]);
    int8_addsub ias7({c[5], w12[7:1]}, w13[7:0], cin, w14[7:0], c[6]);
    assign product[7] = w14[0];
    
    assign product[15:8] = {c[6], w14[7:1]};

endmodule
