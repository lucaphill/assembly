.data
    A: .word 1,2,3,4,5,6,7,8
    B: .space 32
.text
.globl main
main:
    la t0, A 
    la t1, B 
    li t2, 0
    li t3, 8

    j loop
loop:
    bge t2, t3, fim
    lw t4, 0(t0)

    # B[i] = 2*A[i]
    add t5, t4, t4
    sw t5, 0(t1)

    addi t0, t0, 4
    addi t1, t1, 4
    addi t2,t2,1

    j loop
fim:
    li a7, 10
    ecall