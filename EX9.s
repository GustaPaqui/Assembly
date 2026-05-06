.data
    msg_a:   .asciiz "Digite A: "
    msg_b:   .asciiz "Digite B (diferente de zero): "
    msg_r:   .asciiz "Resultado: "
    msg_nl:  .asciiz "\n"

.text
.globl main

main:
    li   $v0, 4
    la   $a0, msg_a
    syscall
    li   $v0, 5
    syscall
    move $s0, $v0

loop:
    li   $v0, 4
    la   $a0, msg_b
    syscall
    li   $v0, 5
    syscall
    move $s1, $v0

    beq  $s1, $zero, loop

    div  $s0, $s1
    mflo $s2

    li   $v0, 4
    la   $a0, msg_r
    syscall
    li   $v0, 1
    move $a0, $s2
    syscall
    li   $v0, 4
    la   $a0, msg_nl
    syscall

    li   $v0, 10
    syscall
