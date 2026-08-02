#int a = 3;
#int b = 4;
#int m = 10;
#int n =0;
##if ( b < m && n < a )
#n = b;
##else n = m;
.text
main:
    li s0, 3 # a
    li s1, 4 # b
    li s2, 10 # m
    li s3, 0 # n
    # comparação
    bge s1, s2, falso
    bge s3, s0, falso
    addi s3, s1, 0
    jal x0, fim
falso:
    addi s3, s2, 0
fim:
    li a7, 10
    ecall