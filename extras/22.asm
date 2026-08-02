#funcaoA chama funcaoB
#funcaoB chama funcaoC
#funcaoC não chama ninguém, só retorna
.text
main:
    li s0, 10
    jal ra, mult2

    li a7, 10
    ecall
mult2:
    add s0, s0, s0
    addi sp, sp, -8
    sw s0, 4(sp)
    sw ra, 0(sp)

    jal ra, soma2
    addi t0, s0, 0

    lw ra, 0(sp)
    addi sp, sp, 4
    lw s0, 0(sp)
    addi sp, sp, 4

    add s0, s0, t0
    jalr x0, 0(ra)
soma2:
    addi s0, s0, 2
    jalr x0, 0(ra)