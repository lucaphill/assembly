.data
numero: .string "01111111111111111111111111111111" 
limite: .word 32
.text
main: 
la s0, numero #carregamos o endereço do numero
lw s1, limite #carregamos o tamanho/limite
li s2, 0 #acumulador

loop_conversao:
lbu a0, 0(s0) #aqui nós carregamos o valor atual como caractere (que ja vem em ascii)
beq a0, zero, sucesso # se o contador limite chegar em 0, pule para sucesso

#ascii, 1 = 49 e 0 = 48
li t3, 48
li t4, 49
blt a0, t3, invalido #se for menor que 0, invalid
blt t4, a0, invalido #se for maior que 1, invalid

sub a0, a0, t3 #nos retiramos 48 do valor de a0, porque ou obteremos 0 ou 1

slli s2,s2, 1 
#IMPORTANTE:
# ao usar o slli (shift left logical immediate) nos fazemos com que todos os bits pulem uma casa pra direita
# essencialmente, nos multiplicamos esse valor por 2, ao executar 4 desses, fizemos 2^4.
# -mas porque que funciona pra numero negativos?
# se o primeiro numero for 1, quando adicionarmos ele s2, e movermos 32 casas para a esquerda, o resultado final
# é um número binário que tem como primeiro numero o 1, que significa que ele é negativo.

or s2, s2, a0
#a gente coloca o ultimo bit com um or, porque se for 0, vai ser 0 or 0 = 0 e se for 1, vai ser 0 or 1 = 1.
# é uma das formas de fazer adição de bits.

addi s0, s0, 1 # offset do ponteiro que avança para a proxima casa/letra (funciona de maneira reversa)
addi s1, s1, -1# diminuimos 1 do contador limite
j loop_conversao# loop

invalido:
li a0, 1 #executado se por algum motivo o numero for maior que 1 e menor do que 0 na tabela ascii
li a7, 1
ecall
j fim

sucesso:
li a0, 0 # zerando a0
add a0,a0,s2 #carregando o valor final em a0
li a7, 1 #imprimindo
ecall

fim:

li a7, 10 #exit
ecall 