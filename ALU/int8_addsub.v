/**
full adder module
**/
module full_adder(a, b, cin, sum, cout);
	input a, b, cin;

	output sum, cout;

	assign sum = a^b^cin;
	assign cout = (a&b)|(b&cin)|(cin&a);
endmodule

/**
combinational adder/subtractor
**/
module int8_addsub(a, b, mux, sum, cout);
	input[7:0] a, b;
	input mux;
	
	output[7:0] sum;
	output cout;

	wire[7:0] w;

	full_adder f0(a[0], b[0]^mux, mux, sum[0], w[0]);
	full_adder f1(a[1], b[1]^mux, w[0], sum[1], w[1]);
	full_adder f2(a[2], b[2]^mux, w[1], sum[2], w[2]);
	full_adder f3(a[3], b[3]^mux, w[2], sum[3], w[3]);
	full_adder f4(a[4], b[4]^mux, w[3], sum[4], w[4]);
	full_adder f5(a[5], b[5]^mux, w[4], sum[5], w[5]);
	full_adder f6(a[6], b[6]^mux, w[5], sum[6], w[6]);
	full_adder f7(a[7], b[7]^mux, w[6], sum[7], w[7]);

	assign cout = w[7];
endmodule