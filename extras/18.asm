# of by one
.text
main:
    li s0, 0
    li a0, 0
    li t0, 5
loop:
    bgt s0, t0, fim
    add a0, a0, s0

    addi s0, s0, 1

    jal x0, loop
fim:
    li a7, 10
    ecall