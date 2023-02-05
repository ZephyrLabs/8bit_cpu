# 8bit_cpu
 A moderate attempt at designing my own CPU with an 8 bit ALU at the core

The ALU operates with 16 bit wide registers, 
but only does 8 bit operations 
(except multiplication which does results in 16 bit  output)

### ALU
|ALU component|operation|type|
|:--:|:--|:--|
|op1|primary operand (16 bits wide)|`input`|
|op2|secondary operand (16 bits wide)|`input`|
|out|output register (16 bits wide)|`output`|
|instruction|instruction mask (8 bits wide)|`input`|
|carry flag|flag holds carry bit from add, sub, rotate and shift operations|`output`|
|parity flag|parity of `out`, 0 - even, 1 - odd|`output`|
|eq flag|flag goes high if the operands are equal|`output`|
|gt flag|flag goes high if the primary operand is greater than or equal to the secondary operand|`output`|

### Instruction Table
|Instruction|opcode|notes|
|:--:|:--|:--|
NOP |8'b00000000|no operation|
ADD |8'b00000001|op1 + op2|
SUB |8'b00000010|op1 - op2|
MUL |8'b00000011|op1 * op2|
AND |8'b00000100|op1 AND op2|
OR  |8'b00000101|op1 OR op2|
NOT |8'b00000101|NOT op1|
XOR |8'b00000110|op1 XOR op2|
INC |8'b00000111|increment op1 (susceptible to integer overflow)|
DEC |8'b00001000|increment op1 (susceptible to integer underflow)|
ROR |8'b00001001|rotate op1 bits right, store LSB in carry flag|
ROL |8'b00001010|rotate op1 bits left, store MSB in carry flag|
RSH |8'b00001011|shift op1 bits right, store LSB in carry flag|
LSH |8'b00001100|shift op1 bits left, store MSB in carry flag|

ref. to `/ALU/verification/arithmetic_unit/arithmetic_unit_tb.v`

for sample instance and example :

### Factorial:


```
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
```

#### Waveform:
![waveform](/ALU/verification/arithmetic_unit/waveform.png)

### Usage:
requires:
```
* iverilog
* gtkwave
```
one liner to view output:
```
cd ALU/verification/arithmetic_unit/ && 
iverilog -o arithmetic_unit_tb.vvp arithmetic_unit_tb.v && 
vvp arithmetic_unit_tb.vvp && 
gtkwave arithmetic_unit.vcd 
```