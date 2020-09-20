.data
nl: .asciiz "\n"

.text
.globl main

#s0 -> i <(el contador)
# s1 -> 101
#s2 -> i / 3
main:

li $s0, 1                    # i = 1
li $s1, 101                  # el valor para salir del loop

loop:
beq $s0, $s1, exit
# Chequeamos que s0 es divisible por 3
rem $s2, $s0, 3              # i / 3
beq $s2, $zero, print        # if (i / 3 = 0)
# Chequeamos que s0 es divisible por 5
rem $s2, $s0, 5              # i / 5
beq $s2, $zero, print        # if (i / 5 = 0)
j endprint

print:
# imprimir el valor de $s0 y \n
li $v0, 1
move $a0, $s0
syscall
li $v0, 4
la $a0, nl
syscall

endprint:
addi $s0, $s0, 1             # sumamos 1
j loop

exit:
li $v0, 10
syscall                      # exit
