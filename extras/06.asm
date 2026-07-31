#int A[8] = {1, 2, 3, 4, 5, 6, 7, 8};
#int B[8];
#for (i = 0; i < 8; i++) {
#    B[i] = A[i] * 2;
#}
.data
    A: .word 1,2,3,4,5,6,7,8
    B: .word 0,0,0,0,0,0,0,0
.text
.globl main
main:
    la a1, A
    la a2, B
    li t2, 0
    li t3, 8

    j loop
loop:
    bge t2, t3, fim
    # carrega o endereço de A[i]
    slli t4, t2, 2
    add t5, t4, a1
    # carrega o endereço de B[i]
    add t1, t4, a2

    # lê o valor de A[i]
    lw t6, 0(t5)
#int A[8] = {1, 2, 3, 4, 5, 6, 7, 8};
#int B[8];
#for (i = 0; i < 8; i++) {
#    B[i] = A[i] * 2;
#}
.data
    A: .word 1,2,3,4,5,6,7,8
    B: .word 0,0,0,0,0,0,0,0
.text
.globl main
main:
    la a1, A
    la a2, B
    li t2, 0
    li t3, 8

    j loop
loop:
    bge t2, t3, fim
    # carrega o endereço de A[i]
    slli t4, t2, 2
    add t5, t4, a1
    # carrega o endereço de B[i]
    add t1, t4, a2

    # lê o valor de A[i]
    lw t6, 0(t5)

    add t0, t6,t6 # B[i] = 2*A[i]
    sw t0, 0(t1)

    addi t2, t2, 1

    j loop
fim:
    li a7, 10
    ecall
    add t0, t6,t6 # B[i] = 2*A[i]
    sw t0, 0(t1)

    addi t2, t2, 1

    j loop
fim:
    li a7, 10
    ecall