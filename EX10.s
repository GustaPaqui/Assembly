.data
    msg_a:   .asciiz "Digite A: "
    msg_b:   .asciiz "Digite B: "
    msg_r:   .asciiz "Resto da divisao: "
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

    li   $v0, 4
    la   $a0, msg_b
    syscall
    li   $v0, 5
    syscall
    move $s1, $v0

    bgt  $s0, $s1, calcular

    move $t0, $s0
    move $s0, $s1
    move $s1, $t0

calcular:
    div  $s0, $s1
    mflo $t0

    mult $t0, $s1
    mflo $t1

    sub  $s2, $s0, $t1

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
