.data
    a: .word 10
    b: .word 15
.text
main:
    la a0, a
    lw s0, 0(a0)
    la a0, b 
    lw s1, 0(a0)
    li t0, 0
    li t1, 0
mult:
    beq t0, s0, fim
    add t1, t1, s1 # soma b, a vezes

    addi t0, t0, 1
    jal x0, mult
fim:
    li a0, 0
    addi a0, t1, 0
    li a7, 10
    ecall