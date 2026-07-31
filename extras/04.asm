# tentativa de fazer um while simples
# while(i < 10) i + 1
.data
    i: .word 0
.text
.globl main
main:
    la a2, i
    lw a2, 0(a2)
    j while

while:
    li t1, 10
    bge a2, t1, cont # se for falso, sai do while
    addi a2, a2, 1 # a2 = a2 + 1
    mv  a0, a2 # a0 = a2
    li a7, 1
    ecall
    j while
cont:
    li a7, 10
    ecall
    
