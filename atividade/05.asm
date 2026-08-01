# primeiro vamos implementar a função de fatorial
# coloque primeiro o valor de n, depois o valor de s
.data
    n: .word 0
    s: .word 0
    comb: .word 0
.text
.globl main
main:
    la t0, n 
    la t1, s 
    # pega os valores para n
    li a0, 0
    li a7, 5
    ecall
    sw a0, 0(t0)
    # pega o valor de s
    li a0, 0
    li a7, 5
    ecall
    sw a0, 0(t1)
    # pega os valores nos endereços
    lw t5, 0(t0)
    lw t4, 0(t1)
    # faz as verificações
    bgt t4, t5, sgn # s > n
    blt t5, x0, ltz # n < 0
    blt t4, x0, ltz # s < 0
    beq t5, t4, eql # s = n
    beq t5, x0, eqz # s = 0
    beq t4, x0, eqz # n = 0

    # calcula n! e armazena em s0
    addi a1, t5, 0
    jal ra, fatorial
    addi s0, a0, 0
    # calcula s! e armazena em s1
    addi a1, t4, 0
    jal ra, fatorial
    addi s1, a0, 0
    # calcula (n-s)! e amazena em s2
    sub t5, t5, t4
    addi a1, t5, 0
    jal ra, fatorial
    addi s2, a0, 0
    # faz s! * (n-s)!
    addi a1, s1, 0
    addi a0, s2, 0
    li t0, 0
    li t1, 0
    jal ra, mult
    # armazena o resultado dessa multiplicação em s3
    addi s3, a0, 0
    # faz n! / o resultado anterior
    addi a1, s3, 0
    addi a0, s0, 0
    li t0, 0
    jal ra, divi
    # guarda o resultado em comb
    la t1, comb
    sw a0, 0(t1)
    li a7, 1
    ecall
    li a7, 10
    ecall
fatorial:
    beq a1, x0, fim_fatorial
    addi sp, sp, -8
    sw a1, 4(sp)
    sw ra, 0(sp)
    # prepara a função pra chamar denovo
    addi a1, a1, -1
    jal ra, fatorial
    # recupera os valores
    lw ra, 0(sp)
    addi sp, sp, 4
    lw a1, 0(sp)
    addi sp, sp, 4
    # preparando a multiplicação
    li t0, 0
    li t1, 0
mult:
    bge t0, a1, fim_mult
    add t1, t1, a0

    addi t0, t0, 1
    jal x0, mult
fim_mult:
    addi a0, t1, 0
    jalr x0, 0(ra)
fim_fatorial:
    li a0, 1
    jalr x0, 0(ra)
divi:
    bgt a1, a0, fim_divi
    sub a0, a0, a1

    addi t0, t0, 1
    jal x0, divi
fim_divi:
    addi a0, t0, 0
    jalr x0, 0(ra)
sgn:
    la t1, comb
    li a0, 1
    sw a0, 0(t1)
    li a7, 10
    ecall
ltz:
    la t1, comb
    li a0, 2
    sw a0, 0(t1)
    li a7, 10
    ecall
eql:
    la t1, comb
    li a0, 3
    sw a0, 0(t1)
    li a7, 10
    ecall
eqz:
    la t1, comb
    li a0, 4
    sw a0, 0(t1)
    li a7, 10
    ecall