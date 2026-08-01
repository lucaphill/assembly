# Empilhe esses 3 valores e desempilhe depois em t0,t1,t2
# li a1, 5
# li a2, 10
# li a3, 15
.text
.globl main
main:
    li a1, 5
    li a2, 10
    li a3, 15
    addi sp, sp, -12
    sw a1, 8(sp)
    sw a2, 4(sp)
    sw a3, 0(sp)
    lw t0, 0(sp)
    addi sp, sp, 4
    lw t1, 0(sp)
    addi sp, sp, 4
    lw t2, 0(sp)
    addi sp, sp, 4
    li a7, 10
    ecall