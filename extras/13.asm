# potenciação com recursão
.text
.globl main
main:
    li s0, 2
    li t0, 5
    li a0, 0
    jal ra, pow
    li a7, 10
    ecall
pow:
    beq t0, x0, fim_pow
    addi sp, sp, -4
    sw ra, 0(sp)
    # preparando ^n-1
    addi t0, t0, -1
    jal ra, pow
    # recuperando o ponteiro
    lw ra, 0(sp)
    addi sp, sp, 4
    li t1, 0
    li t2, 0
mult:
    bge t1, a0, fim_mult
    add t2, t2, s0

    addi t1, t1, 1
    jal x0, mult
fim_mult:
    addi a0, t2, 0
    jalr x0, 0(ra)
fim_pow:
    li a0, 1
    jalr x0, 0(ra)