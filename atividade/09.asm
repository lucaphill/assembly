#int i;
#int A[10];
#for (i=0; i<10; i++) {
#A[i]=A[i]+1;
#}
.data
    A: .word 1,2,3,4,5,6,7,8,9,10
.text
main:
    li s0, 0 # i
    la s1, A
    li t0, 10 # condição de parada
loop:
    bge s0, t0, fim
    lw t1, 0(s1)

    addi t1, t1, 1

    sw t1, 0(s1)
    addi s1, s1, 4
    addi s0, s0, 1

    jal x0, loop
fim:
    li a7, 10
    ecall