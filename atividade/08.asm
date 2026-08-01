# substitui String(x, y)
# acha as ocorrencias de x e troca por y
# percorrer toda a string conferindo de _ == x e se for _ = y
.data
    string: .asciz "Polindromo"
    x: .asciz "o"
    y: .asciz "a"
.text
.globl main
main:
    la t0, string
    la s0, x
    la s1, y
    lb t2, 0(s0)
    lb t3, 0(s1)
    li t4, 10
percore_string:
    lb t1, 0(t0)
    beq t1, t4, fim
    beq t1, x0, fim
    beq t1, t2, troca

    addi t0, t0, 1
    jal x0, percore_string
troca:
    addi t1, t3, 0 # aqui primeiro eu troco o valor que tava em string[i] pelo y
    sb t1, 0(t0) # depois eu coloco esse valor novo na memoria
    addi t0, t0, 1 # aumento o i

    jal x0, percore_string
fim:
    li a7, 10
    ecall
