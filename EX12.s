.data
    msg_h:   .asciiz "Digite a altura (cm): "
    msg_min: .asciiz "Menor altura: "
    msg_max: .asciiz "Maior altura: "
    msg_cm:  .asciiz " cm\n"

.text
.globl main

main:
    li   $v0, 4
    la   $a0, msg_h
    syscall
    li   $v0, 5
    syscall
    move $s0, $v0
    move $s1, $v0
    li   $s2, 1

loop:
    beq  $s2, 15, exibir

    li   $v0, 4
    la   $a0, msg_h
    syscall
    li   $v0, 5
    syscall
    move $t0, $v0

    bge  $t0, $s0, testa_max
    move $s0, $t0

testa_max:
    ble  $t0, $s1, proximo
    move $s1, $t0

proximo:
    addi $s2, $s2, 1
    j    loop

exibir:
    li   $v0, 4
    la   $a0, msg_min
    syscall
    li   $v0, 1
    move $a0, $s0
    syscall
    li   $v0, 4
    la   $a0, msg_cm
    syscall

    li   $v0, 4
    la   $a0, msg_max
    syscall
    li   $v0, 1
    move $a0, $s1
    syscall
    li   $v0, 4
    la   $a0, msg_cm
    syscall

    li   $v0, 10
    syscall
