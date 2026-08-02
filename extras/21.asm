#int contador = 0;
#int limite = 5;
# incremente "contador" 5 vezes, um a um, salvando na memória a cada passo
.data
    contador: .word 0
    limite: .word 5
.text
main:
    la a0, contador
    la t0, limite
    jal x0, loop
loop:
    lw t2, 0(a0)
    lw t1, 0(t0)
    bge t2, t1, fim
    addi t2, t2, 1
    sw t2, 0(a0)
    sw t1, 0(t0)

    jal x0, loop
fim:
    li a7, 10
    ecall