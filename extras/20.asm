#char texto[] = "banana";
# conte quantas vezes aparece a letra 'a'
.data
    texto: .string "banana"
.text
main:
    li s0, 97 # A
    li s1, 10 # \n
    la s2, texto
    li a0, 0 # contador
loop:
    lb t0, 0(s2)
    beq t0, s1, fim
    beq t0, x0, fim
    beq t0, s0, soma

    addi s2, s2, 1
    jal x0, loop
soma:
    addi a0, a0, 1
    addi s2, s2, 1
    jal x0, loop
fim:
    li a7, 1
    ecall
    li a7, 10
    ecall