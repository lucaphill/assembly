.data
    vetorX: .byte 1, 0, 1, 1, 0, 0, 1, 1, 0, 1
    .align 2
    nd1: .space 64
.text
main:
    la s0, vetorX
    li s1, 64
    li t0, 0
    li s2, 0 # contador
    li s3, 1
contador:
    beq t0, s1, fim
    lb t1, 0(s0)
    beq t1, s3, soma

    jal x0, continua
soma:
    addi s2, s2, 1
continua:
    addi s0, s0, 1
    addi t0, t0, 1

    jal x0, contador
fim:
    la a0, nd1
    addi t0, s2, 0
    sw t0, 0(a0)
    addi a0, s2, 0
    li a7, 1
    ecall
    li a7, 10
    ecall