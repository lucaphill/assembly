# int A[5] = {4,7,2,8,5}
# soma(vetor, n) // retorna 0 se n == 0
.data
A: .word 4,7,2,8,5
n_el: .word 5
msg: .asciiz "Soma do vetor = "

.text
.globl main

main:
    la a0, A
    la t0, n_el
    lw a1, 0(t0)
    jal ra, soma_vetor # pula depois de carregar os arquios

    mv t1,a0
    la a0, msg
    li a7, 4 # printa a string
    ecall

    mv a0, t1
    li a7, 1 # printa o valor
    ecall

    li a7, 10
    ecall
soma_vetor:
    beq a1, x0, base
    addi sp, sp, -8
    sw ra, 4(sp) # guarda o retorno

    lw t0, 0(a0)
    sw t0, 0(sp) # salva o vetor na pilha
    # prepara para a próxima
    addi a0, a0, 4
    addi a1, a1, -1

    jal ra, soma_vetor
    lw t0, 0(sp)
    add a0, a0, t0
    lw ra, 4(sp)
    addi sp, sp, 8
    ret
base:
    li a0, 0
    ret