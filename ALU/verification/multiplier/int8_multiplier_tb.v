`include "../../int8_multiplier.v"

module int8_multiplier_tb;
	reg[7:0] a, b;

	wire[15:0] product;

    int8_multiplier h1(a, b, product);

    initial begin
        $dumpfile("int8_multiplier.vcd");
        $dumpvars(0, int8_multiplier_tb);

        a = 8'b01000011; 
        b = 8'b00110101;
        #1
        //mux = 1;
        a = 8'b11111111; 
        b = 8'b00001111;
        #1
        a = 8'b11111111; 
        b = 8'b00001111;
        #1
        a = 8'b00000000; 
        b = 8'b00000000;
    end

endmodule