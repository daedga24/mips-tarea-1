# t0 -> a
# t1 -> b
# t2 -> c
# t3 -> i (contador del for)

.data

nl: .asciiz "\n"

.text
.globl main

main:

li $t0, 0              # carga 0 en t0
li $t1, 1              # carga 1 en t1



li $v0, 1
move $a0, $t0
syscall                # imprime t0

li $v0, 4
la $a0, nl
syscall                # imprime \n

li $v0, 1
move $a0, $t1
syscall                # imprime t1

li $v0, 4
la $a0, nl
syscall                # imprime \n

# carga 18 en i

li $t3, 18
loop:
beq $t3, $zero, exit
# codigo loop

add $t2, $t0, $t1      # c = a + b
# imprimir c

li $v0, 1
move $a0, $t2
syscall                #imprime t2
move $t0, $t1          # a = b
move $t1, $t2          # b = c

# imprimimos el \n

li $v0, 4
la $a0, nl
syscall                # imprime \n

# decrementar contador

addi $t3, $t3, -1

j loop                 # devuelta el loop


exit:
li $v0, 10
syscall                # exit
