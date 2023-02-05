`include "../../int8_addsub.v"

module int8_addsub_tb;
	reg[7:0] a, b;
    reg mux;
	wire[7:0] sum;
    wire cout;

    int8_addsub h1(a, b, mux, sum, cout);

    initial begin
        $dumpfile("int8_addsub.vcd");
        $dumpvars(0, int8_addsub_tb);

        mux = 0;
        a = 8'b01000011; 
        b = 8'b00110101;
        #1
        //mux = 1;
        a = 8'b11111111; 
        b = 8'b00001111;
        #1
        mux = 1;
        a = 8'b11111111; 
        b = 8'b00001111;
        #1
        a = 8'b00000000; 
        b = 8'b00000000;
    end

endmodule