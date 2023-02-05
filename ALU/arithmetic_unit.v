`include "../../int8_multiplier.v"
`include "../../int8_cmp.v"
`include "../../int8_logic.v"

/**
main ALU
**/
module arithmetic_unit(op1, op2, out, instruction, carry_flag, parity_flag, eq_flag, gt_flag);

    /* operands and instruction */
    input[15:0] op1, op2;
    input[7:0] instruction;

    /* output register */
    output reg[15:0] out;

    /* flags */
    output reg carry_flag;
    output eq_flag, gt_flag, parity_flag;

    /* latched output registers */
    wire reg[7:0] add_reg;
    wire reg[7:0] sub_reg;
    wire reg[15:0] mul_reg;
    wire reg[7:0] and_reg;
    wire reg[7:0] or_reg;
    wire reg[7:0] not_reg;
    wire reg[7:0] xor_reg;
    wire reg[7:0] inc_reg;
    wire reg[7:0] dec_reg;
    wire reg[7:0] ror_reg;
    wire reg[7:0] rol_reg;
    wire reg[7:0] rsh_reg;
    wire reg[7:0] lsh_reg;   

    /* flag latched outputs */
    wire add_c;
    wire sub_c;
    wire ror_c;
    wire rol_c;
    wire rsh_c;
    wire lsh_c;

    wire cmp_gt;
    wire cmp_eq;
    
    /* adder/subtractor enable */
    wire add_en = 0;
    wire sub_en = 1;

    /**
    instruction table
    **/
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

    /* logic block instances */
    int8_addsub add(op1[7:0], op2[7:0], add_en, add_reg, add_c);   
    int8_addsub sub(op1[7:0], op2[7:0], sub_en, sub_reg, sub_c);
    int8_multiplier mul(op1[7:0], op2[7:0], mul_reg);
    int8_cmp cmp(op1[7:0], op2[7:0], gt_flag, eq_flag);
    int8_and and8(op1[7:0], op2[7:0], and_reg);
    int8_or or8(op1[7:0], op2[7:0], or_reg);
    int8_not not8(op1[7:0], not_reg);
    int8_and xor8(op1[7:0], op2[7:0], xor_reg);
    int8_inc inc8(op1[7:0], inc_reg);
    int8_dec dec8(op1[7:0], dec_reg);
    int8_ror ror8(op1[7:0], ror_reg, ror_c);
    int8_rol rol8(op1[7:0], rol_reg, rol_c);
    int8_rsh rsh8(op1[7:0], rsh_reg, rsh_c);
    int8_lsh lsh8(op1[7:0], lsh_reg, lsh_c);


    /**
    multiplex the latched outputs
    **/
    always @ (*)
        case(instruction)
            ADD: 
                begin
                    out=add_reg; carry_flag=add_c;
                end
            SUB:   
                begin
                    out=sub_reg; carry_flag=sub_c;
                end
            MUL: out=mul_reg;
            AND: out=and_reg;
            OR: out=or_reg;
            NOT: out=not_reg;
            XOR: out=xor_reg;
            INC: out=inc_reg;
            DEC: out=dec_reg;
            ROR: 
                begin
                    out=ror_reg;
                    carry_flag=ror_c;
                end
            ROL: 
                begin
                    out=rol_reg;
                    carry_flag=rol_c;
                end
            RSH: 
                begin
                    out=rsh_reg;
                    carry_flag=rsh_c;
                end
            LSH: 
                begin
                    out=lsh_reg;
                    carry_flag=lsh_c;
                end
            NOP: out=out;
        endcase

    assign parity_flag=out[0]^out[1]^out[2]^out[3]^out[4]^out[5]^out[6]^out[7]^out[8]^out[9]^out[10]^out[11]^out[12]^out[13]^out[14]^out[15];
endmodule
