#int A[8] = {5, 12, 7, 20, 3, 8, 15, 4};
#int pares = 0;
#int impares = 0;
#for (i = 0; i < 8; i++) {
#    #if (A[i] % 2 == 0)
#        pares = pares + 1;
#    #else
#        impares = impares + 1;
#}
.data
    A: .word 5,12,7,20,3,8,15,4
    pares: .word 0
    impares: .word 0
.text
.globl main
main:
    la t0, A 
    la t1, pares
    la t2, impares
    li t3, 0 # i
    li t4, 8
    li a1, 1

    j loop
loop:
    bge t3, t4, fim
    # pega os valores de A[i]
    lw t5, 0(t0)
    ##if (imprar)
    andi a2, t5, 1
    beq a2, a1, impar
    # se for par
    lw a3, 0(t1)
    addi a3, a3, 1
    sw a3, 0(t1)

    j fim_loop
impar:
    lw a4, 0(t2)
    addi a4, a4, 1
    sw a4, 0(t2)
fim_loop:
    addi t0, t0, 4
    addi t3, t3, 1
    j loop
fim:
    li a7, 10
    ecall