# 32bit-proccessor
an improved version of 16 bit processor, adding j-type instruction and expand to 32bit
![image](https://github.com/user-attachments/assets/dff18dab-10d2-4bb6-a77e-30848cbfe2f8)
1. ADD rd, rs, rt: Reg[rd] = Reg[rs] + Reg[rt].
2. SUB rd, rs, rt: Reg[rd] = Reg[rs] – Reg[rt].
3. J target: PC = { PC[31:28], target, 00 }.
5. XORI rt, rs, imm16: Reg[rt] = Reg[rs] XOR Zero_ext(Imm16).
6. SLT rd, rs, rt: If (Reg[rs] < Reg[rt]) Reg[rd] = 00000001 else Reg[rd] = 00000000.
7. BEQ rs, rt, imm16: if (Reg[rs] == Reg[rt]) PC = PC + 4 + Sign_ext(Imm16)<<2 else PC = PC + 4.
8. SW rt, imm16(rs): Mem[Reg[rs] + Sign_ext(Imm16)] = Reg[rt].
9. LW rt, imm16(rs): Reg[rt] = Mem[Reg[rs] + Sign_ext(Imm16)].
