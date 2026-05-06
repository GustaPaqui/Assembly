.data
    msg_p:   .asciiz "Qtd PEQUENAS (R$10): "
    msg_m:   .asciiz "Qtd MEDIAS (R$12): "
    msg_g:   .asciiz "Qtd GRANDES (R$15): "
    msg_tot: .asciiz "Valor total: R$ "
    msg_nl:  .asciiz "\n"

.text
.globl main

main:
    li   $v0, 4
    la   $a0, msg_p
    syscall
    li   $v0, 5
    syscall
    move $s0, $v0

    li   $v0, 4
    la   $a0, msg_m
    syscall
    li   $v0, 5
    syscall
    move $s1, $v0

    li   $v0, 4
    la   $a0, msg_g
    syscall
    li   $v0, 5
    syscall
    move $s2, $v0

    li   $t0, 10
    mult $s0, $t0
    mflo $s3

    li   $t0, 12
    mult $s1, $t0
    mflo $t1

    li   $t0, 15
    mult $s2, $t0
    mflo $t2

    add  $s4, $s3, $t1
    add  $s4, $s4, $t2

    li   $v0, 4
    la   $a0, msg_tot
    syscall
    li   $v0, 1
    move $a0, $s4
    syscall
    li   $v0, 4
    la   $a0, msg_nl
    syscall

    li   $v0, 10
    syscall