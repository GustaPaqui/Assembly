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

    bgez $s0, positivo

negativo:
    li   $t0, 3
    mult $s0, $t0
    mflo $s1
    j    fim

positivo:
    li   $t0, 2
    mult $s0, $t0
    mflo $s1

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
