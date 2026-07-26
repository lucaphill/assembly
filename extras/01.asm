# Completa
.data
    a: .word 10
    b: .word 20
.text
.globl main
main:
    la a1, a 
    lw a1, 0(a1) # carrega a palavra que tava como endereço em a1
    la a2, b
    lw a2, 0(a2)

    add a0, a1, a2

    li a7, 1 # código pra imprimir inteiros
    ecall
    # sempre precisa ter essa parte pra funcionar
    li a7, 10
    ecall
