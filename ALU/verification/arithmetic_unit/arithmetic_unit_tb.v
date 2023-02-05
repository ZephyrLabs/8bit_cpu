`include "../../arithmetic_unit.v"

/**
test bench device
**/
module arithmetic_unit_tb;
	reg[15:0] op1, op2;
    reg[7:0] instruction;

    reg[15:0] temp;

    wire[15:0] out;
	wire reg carry_flag, parity_flag, eq_flag, gt_flag;

    arithmetic_unit alu(op1, op2, out, instruction, carry_flag, parity_flag, eq_flag, gt_flag);

    parameter NOP = 8'b00000000;
    parameter ADD = 8'b00000001;
    parameter SUB = 8'b00000010;
    parameter MUL = 8'b00000011;
    parameter AND = 8'b00000100;
    parameter OR  = 8'b00000101;
    parameter NOT = 8'b00000101;
    parameter XOR = 8'b00000110;
    parameter INC = 8'b00000111;
    parameter DEC = 8'b00001000;
    parameter ROR = 8'b00001001;
    parameter ROL = 8'b00001010;
    parameter RSH = 8'b00001011;
    parameter LSH = 8'b00001100;

    initial begin
        $dumpfile("arithmetic_unit.vcd");
        $dumpvars(0, arithmetic_unit_tb);

        /**
        factorial calculation of 5
        **/
        op1 = 10'd5;
        op2 = 10'd1;
        instruction = MUL;
        #1
        op2 = out;
        #1
        instruction = DEC;
        #1
        op1 = out;
        #1
        instruction = MUL;
        #1
        op2 = out;
        #1
        instruction = DEC;
        #1
        op1 = out;
        #1
        instruction = MUL;
        #1
        op2 = out;
        #1
        instruction = DEC;
        #1
        op1 = out;
        #1
        instruction = MUL;
        #1
        op2 = out;
        #1
        instruction = DEC;
        #1
        op1 = out;
        #1
        instruction = NOP;

    end
endmodule