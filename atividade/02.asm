##int a = ...;
##int b = ...;
##x = 0;
##if ( a >= 0 && b <= 50 )
##x = 1;
.text
main:
    li a7, 5
    ecall
    addi s0, a0, 0 # s0 = a
    li a7, 5
    ecall
    addi s1, a0, 0 # s1 = b
    li s2, 0 # s2 = x
    li t0, 50
    #comparações
    blt s0, x0, fim
    bgt s1, t0, fim
    li s2, 1
    jal x0, fim
fim:
    li a7, 10
    ecall