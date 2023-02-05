/**
logical and operation
**/
module int8_and(a, b, c);
    input[7:0] a, b;

    output [7:0] c;

    assign c=a&b;
endmodule

/**
logical or operation
**/
module int8_or(a, b, c);
    input[7:0] a, b;

    output [7:0] c;

    assign c=a|b;
endmodule

/**
logical not operation
**/
module int8_not(a, b);
    input[7:0] a; 

    output[7:0] b;

    assign b=~a;
endmodule

/**
logical xor operation
**/
module int8_xor(a, b, c);
    input[7:0] a, b;

    output [7:0] c;

    assign c=a^b;
endmodule

/**
logical increment operation
**/
module int8_inc(a, b);
    input[7:0] a; 

    output[7:0] b;

    assign b = a + 8'b00000001;
endmodule

/**
logical decrement operation
**/
module int8_dec(a, b);
    input[7:0] a; 

    output[7:0] b;

    assign b = a - 8'b00000001;
endmodule

/**
logical right rotate operation
**/
module int8_ror(a, b, c);
    input[7:0] a;

    output[7:0] b;
    output c;

    assign b = {a[0], a[7:1]};
    assign c = a[0];
endmodule

/**
logical left rotate operation
**/
module int8_rol(a, b, c);
    input[7:0] a;

    output[7:0] b;
    output c;

    assign b = {a[6:0], a[7]};
    assign c = a[7];
endmodule

/**
logical right shift operation
**/
module int8_rsh(a, b, c);
    input[7:0] a;

    output[7:0] b;
    output c;

    assign b = a >> 1;
    assign c = a[0];
endmodule

/**
logical left shift operation
**/
module int8_lsh(a, b, c);
    input[7:0] a;

    output[7:0] b;
    output c;

    assign b = a << 1;
    assign c = a[7];
endmodule
