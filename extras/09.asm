# entrada: string terminada em \0
# saída: número de vogais (a,e,i,o,u), maiúsculas ou minúsculas, em um registrador
.data
    string: .space 100
    contador: .word 0
.text
.globl main
main:
    la a0, string
    li a1, 100
    li a7, 8
    ecall
    la t0, string
    la a5, contador
    lb a0, 0(a5)
    li a4, 10
    j contador_vogais
contador_vogais:
    lb t1, 0(t0)
    beq t1, a4, fim
    beq t1, x0, fim
    li t2, 65
    li t3, 69
    li t4, 73
    li t5, 79
    li t6, 85
    # fazendo os if's
    jal ra, compara
    # trocando pra minusculas
    li t2, 97
    li t3, 101
    li t4, 105
    li t5, 111
    li t6, 117
    # fazendo os ifs
    jal ra, compara

    addi t0, t0, 1
    j contador_vogais
compara:
    beq t1, t2, vogal
    beq t1, t3, vogal
    beq t1, t4, vogal
    beq t1, t5, vogal
    beq t1, t6, vogal
    jalr x0, 0(ra)
vogal:
    addi a0, a0, 1
    addi t0, t0, 1
    j contador_vogais
fim: 
    sb a0, 0(a5)
    li a7, 10
    ecall