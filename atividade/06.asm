# pega um numero representado como string e transforma em um numero real
.data
    string: .space 32
.text
main:
    la a0, string
    li s0, 0
    li a1, 32
    li a7, 8
    ecall
    #--- preparando os valores para verificar a string ---
    li t0, 10 # fim da string (\n)
    li s1, 48
    li s2, 49
tratamento:
    lb t1, 0(a0) # valor apontado em a0 (numero a comparar)
    beq t1, t0, fim
    beq t1, x0, fim # ve se ta no fim da string
    beq t1, s1, continua
    beq t1, s2, continua
    #--- se chegou aqui algo ta errado ---
    li a0, 1 # código de erro
    li a7, 10
    ecall
continua:
    addi t1, t1, -48 # converte em um número de verdade
    slli s0, s0, 1 # abre espaço para colocar um bit novo
    or s0, s0, t1 # coloca t1 no fim de s0

    addi a0, a0, 1 # incrementa o ponteiro para a próxima letra
    jal x0, tratamento
fim:
    addi a0, s0, 0
    li a7, 1
    ecall
    li a7, 10
    ecall