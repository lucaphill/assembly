.text
.globl main
main:
    li a1, 7
    li a2, 3
    jal ra, soma
    li a7, 1
    ecall
    li a7, 10
    ecall
soma:
    add a0, a1, a2
    addi sp, sp, -4
    sw ra, 0(sp)
    jal ra, dobro

    lw ra, 0(sp)
    addi sp, sp, 4
    jalr x0, 0(ra)
dobro:
    add a0, a0, a0
    jalr x0, 0(ra)
