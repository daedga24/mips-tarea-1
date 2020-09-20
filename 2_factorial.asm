# t0 -> a
# t1 -> b
# t2 -> c
# t3 -> i (contador del for)

.data

prompt: .asciiz " Ingrese un numero\n"

.text
.globl main
main:

li $v0, 4             # code para imprimir string
la $a0, prompt        # carga direccion del string
syscall               # imprime prompt

li $v0, 5             # code para leer int
syscall               # lee int y guarda resultado en $v0
move $t0, $v0         # mueve valor de v0 a t0

addi $a0, $t0, -1     # resto 1 a $a0

loop:
beq $a0, $zero, exit
mul $t0, $t0, $a0     # multiplico $t0 y lo guardo
addi $a0, $a0, -1     # resto 1 a $a0

j loop

exit:
li $v0, 1
move $a0, $t0         # mueve valor de v0 a t0
syscall

li $v0, 10
syscall               # exit
