# empilhando coisas
.data
# valor da contagem
n: .word 5 
msg: .asciiz "Soma de 1 ate n = "

.text
.globl main

main:
    la a0, n # carrega o endereço de n
    lw a0, 0(a0) # le o valor de n para a0
    jal ra, soma_rec
    mv t1, a0
    la a0,msg # carrega o endereço da string
    li a7, 4 # código para printar a string
    ecall

    mv a0, t1
    li a7, 1 # código para printar inteiro
    ecall

    li a7, 10 # encerra o programa
    ecall 
soma_rec:
    addi sp,sp,-8
    sw ra, 4(sp) # salva ra em sp+4    
    sw a0, 0(sp) # sala a0 em sp+0

    beq a0, x0, caso_base # if a0 =x0t1 then target
    addi a0, a0, -1
    jal ra, soma_rec # chama a função denovo com n-1
    lw t0, 0(sp) # recupera n

    add a0, a0, t0

    lw ra, 4(sp)
    addi sp, sp, 8
    ret
caso_base:
    li a0, 0
    lw ra, 4(sp)
    addi sp, sp, 8
    ret
