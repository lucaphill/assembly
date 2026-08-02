#int a = 10;
#int b = 3;
# calcule (a + b) e (a - b), imprima os dois
.text
main:
    li s0, 10
    li s1, 3
    add a0, s0, s1
    li a7, 1
    ecall
    sub a0, s0, s1
    li a7, 1
    ecall
    li a7, 10
    ecall