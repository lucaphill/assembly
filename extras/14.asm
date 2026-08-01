# pegua o valor absoluto |n|
.text
.globl main
main:
    li a0, 0
    li a7, 5
    ecall
    addi t0, a0, 0
    blt t0, x0, modulo
    li a7, 10
    ecall
modulo:
    sub t0, x0, t0 # t0 = 0 - t0 -> inverte o sinal de t0
    li a7, 10
    ecall