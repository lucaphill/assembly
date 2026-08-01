# fatorial
.text
.globl main
main:
    li a1, 5
    jal ra, fatorial
    li a7, 1 # imprimi o resultado
    ecall
    li a7, 10
    ecall
fatorial:
    beq a1, x0, fim_fatorial
    addi sp, sp, -8
    sw ra, 4(sp)
    sw a1, 0(sp)
    # preparando a função pro fatorial
    addi a1, a1, -1
    jal ra, fatorial
    # preparando pra multiplicação
    li t0, 0
    li t2, 0
    # recuperando os valores
    lw a1, 0(sp)
    addi sp, sp, 4
    lw ra, 0(sp)
    addi sp, sp, 4
mult:
    bge t0, a1, fim_mult
    add t2, t2, a0 
    addi t0, t0, 1

    jal x0, mult
fim_mult:
    addi a0, t2, 0
    jalr x0, 0(ra)
fim_fatorial:
    li a0, 1
    jalr x0, 0(ra)