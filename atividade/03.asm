.data:
    A: .space 100
    B: .space 100
.text
.globl main
main:
    la t0, A 
    li t1, 0
    li t6, 0
    # pegando imput
    la a0, A 
    li a1, 100
    li a7, 8
    ecall
    
    j descobre_tamanho
descobre_tamanho:
    li t5, 10
    lb t2, 0(t0)
    beq t2, x0, preparando_troca
    beq t2, t5, preparando_troca
    addi t1, t1, 1
    addi t0, t0, 1
    j descobre_tamanho
preparando_troca:
    la t0, A
    j troca_capital
troca_capital:
    bge t6, t1, prepara_inverte 
    lb t2, 0(t0)
    # comparações, maiusculas
    li t3, 64
    li t4, 91
    blt t2, t3, falso
    blt t2, t4, maiuscula
    # comparações, minuscula
    li t3, 96
    li t4, 123
    blt t2, t3, falso
    blt t2, t4, minuscula
maiuscula:
    addi t2, t2, 32
    sb t2, 0(t0) 
    addi t6, t6, 1
    addi t0, t0, 1

    j troca_capital
minuscula:
    addi t2, t2, -32
    sb t2, 0(t0)
    addi t6, t6, 1
    addi t0, t0, 1
    
    j troca_capital
falso:
    li a1, 1
    li a7, 10
    ecall
prepara_inverte:
    la t0, A 
    add t0, t0, t1
    addi t0, t0, -1
    la t3, B

    li t6, 0
    j inverte
inverte:
    beq t6, t1, fim

    lb t2, 0(t0)

    sb t2, 0(t3)
    addi t3, t3, 1    
    addi t0, t0, -1
    addi t6, t6, 1
    j inverte
fim:
    sb x0, 0(t3)
    li a7, 10
    ecall