.data
msg_comp: .asciiz "Digite o comprimento: "
msg_larg: .asciiz "Digite a largura: "
msg_area: .asciiz "Area do terreno: "
msg_m2:  .asciiz " m2\n"
.text
.globl main
main:
li $v0, 4
la $a0, msg_comp
syscall

li $v0, 5
syscall
move $t0, $v0

li $v0, 4
la $a0, msg_larg
syscall

li $v0, 5
syscall
move $t0, $v0

mul $t2, $t0, $t1

li $v0, 4
la $a0, msg_area
syscall

li $v0, 1
move $a0, $t2
syscall

li   $v0, 4
la   $a0, msg_m2
syscall

li $v0,10
syscall