# pegue um valor -> verifica se é negativo ou positivo 
# (caso negativo, coloca - no inicio da string)
# -> faz mod 10 e transforma em char -> coloca no fim da string
.data
    string: .space 100
    b: .space 100
.text
.globl main
main:
    # pega a palavra, inicializa a string
    li a7, 5
    ecall
    la t1, string
    li s5, 10 # vai ser usado no mod
    li t3, 0
    # verifica o sinal
    blt a0, x0, troca_sinal
continua:
    # loop, repete o processo de pegar o ultimo numero até só sobrar 0
loop:
    beq a0, x0, prepara_tamString
    jal ra, mod

    jal x0, loop
troca_sinal:
    li s0, 1
    sub a0, x0, a0 # a0 = 0-a0
    li a1, 45 # codigo do "-"
    jal x0, coloca_string
mod:
    blt a0, s5, fim_mod
    sub a0, a0, s5

    addi t3, t3, 1
    jal x0, mod
fim_mod:
    addi a1, a0, 48 # transforma em char
    addi a0, t3, 0
    li t3, 0
    jal x0, coloca_string
coloca_string:
    lb t2, 0(t1)
    addi t2, a1, 0 # copia o valor de a1 pra string
    sb t2, 0(t1)

    addi t1, t1, 1
    jal x0, continua
prepara_tamString:
    li a0, 0
    la t1, string
tam_string:
    lb t2, 0(t1)
    beq t2, s5, prepara_inverte
    beq t2, x0, prepara_inverte
    
    addi t1, t1, 1
    addi a0, a0, 1 # aumenta o contador
    jal x0, tam_string
prepara_inverte:
    li t2, 1 # para evitar trocar o (-)
    la t0, string 
    addi t0, t1, -1

    la t3, b

    li t6, 0
inverte:
    beq s0, t2, prepara_inverteNetativo
    beq t6, a0, fim

    lb a3, 0(t0)
    sb a3, 0(t3)

    addi t3, t3, 1
    addi t0, t0, -1
    addi t6, t6, 1

    jal x0, inverte
prepara_inverteNetativo:
    li t5, 45
    sb t5, 0(t3)
    addi t3, t3, 1
inverte_negativo:
    addi t4, a0, -1
    beq t6, t4, fim

    lb a3, 0(t0)
    sb a3, 0(t3)

    addi t3, t3, 1
    addi t0, t0, -1
    addi t6, t6, 1

    jal x0, inverte_negativo
fim:
    sb x0, 0(t3)
    la a0, b          # endereço da string final
    li a7, 4              # Print String
    ecall
    li a7, 10
    ecall