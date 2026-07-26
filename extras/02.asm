#int a = 3;
#int b = 7;
#int n = 0;
##if (a > 0 && b < 10)
#    n = 1;
##else
#    n = 2;
.data
    a: .word 3
    b: .word 7
    n: .word 0
.text
.globl main
main:
    # carregando arquivos
    la a1, a 
    lw a1, 0(a1)
    la a2, b 
    lw a2, 0(a2)
    la a0, n
    lw a0, 0(a0)
    # condicional
    blt x0, a1, condicional # if x0 < a1
    j else  # jump to else
    
condicional:
    li t1, 10
    blt a2, t1, condicional2
    j else
condicional2:
    li a0, 1 # a3 = 1 
    li a7, 1
    ecall
    li a7, 10
    ecall
else:
    li a0, 2
    li a7, 1
    ecall
    li a7, 10
    ecall