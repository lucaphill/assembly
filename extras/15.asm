# transforma um numero em char
# pra fazer essa transição, some 48 ao numero...
.text
.globl main
main:
    li t0, 47
    li t1, 10 # 47 / 10
    li t2, 0

    jal ra, _div
    li a7, 11
    ecall
    li a7, 10
    ecall

_div:
    bgt t1, t0, fim_div
    sub t0, t0, t1 # 47 = 47 - 10 = 37

    jal x0, _div
fim_div:
    addi a0, t0, 0
    addi a0, a0, 48 # transforma em char
    jalr x0, 0(ra)