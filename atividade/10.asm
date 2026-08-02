# B da 9
##int i;
##int A[10];
##for (i=0; i<10; i++) {
##if (i%2==0)
##A[i]=A[i]+A[i+1];
##else
##A[i]=A[i]*2;
##}
.data
    A: 1,2,3,4,5,6,7,8,9,10
.text
main:
    li t0, 0
    la s0, A 
    li s1, 10
    li t1, 1
loop:
    bge t0, s1, fim

    andi t2, t0, 1
    beq t2, t1, impar

    lw t3, 0(s0)
    lw t4, 4(s0)
    add t3, t3, t4
    sw t3, 0(s0)

    jal x0, volta
impar:
    lw t3, 0(s0)
    add t3, t3, t3
    sw t3, 0(s0)

    jal x0, volta
volta:
    addi s0, s0, 4
    addi t0, t0, 1
    jal x0, loop
fim:
    li a7, 10
    ecall