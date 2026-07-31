.data 
    A: .word 1,2,3,4,5,6,7,8,9,10
.text
.globl main
main:
    la a1, A 
    li t1, 0
    li t2, 10
    j while

while:
    bge t1, t2, cont
    # calcula o endereço de a[i]
    slli t3, t1, 2 # t3 = t1 * 4
    add t4, a1, t3
    # a[i]++
    lw t5, 0(t4) # pega t4 e carrega em t5
    addi t5, t5, 1
    sw t5, 0(t4) # pega t5 e guarda em t4

    addi t1,t1,1 # aumenta o contador

    j while
cont:
    li a7, 10
    ecall

    
    