.data
    msg_n:   .asciiz "Digite um numero: "
    msg_r:   .asciiz "Resultado: "
    msg_nl:  .asciiz "\n"

.text
.globl main

main:
    li   $v0, 4
    la   $a0, msg_n
    syscall
    li   $v0, 5
    syscall
    move $s0, $v0

    andi $t0, $s0, 1
    beq  $t0, $zero, par

impar:
    addi $s1, $s0, 8
    j    fim

par:
    addi $s1, $s0, 5

fim:
    li   $v0, 4
    la   $a0, msg_r
    syscall
    li   $v0, 1
    move $a0, $s1
    syscall
    li   $v0, 4
    la   $a0, msg_nl
    syscall

    li   $v0, 10
    syscall
