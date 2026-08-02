#int x = 8;
#int y = 0;
#y = x + 1;
.data
    x: .word 8
    y: .word 0
.text
main:
    la s0, x
    la s1, y
    lw t0, 0(s0)
    lw t1, 0(s1)
    addi t1, t0, 1
    sw t1, 0(s1)
fim:
    li a7, 10
    ecall
