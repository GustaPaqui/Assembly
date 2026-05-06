.data
    msg_n:   .asciiz "Digite um numero entre 0 e 100 (negativo para sair): "
    msg_inv: .asciiz "Numero invalido! Digite entre 0 e 100 ou negativo para sair.\n"
    msg_i1:  .asciiz "Intervalo [0-25]:   "
    msg_i2:  .asciiz "Intervalo [26-50]:  "
    msg_i3:  .asciiz "Intervalo [51-75]:  "
    msg_i4:  .asciiz "Intervalo [76-100]: "
    msg_nl:  .asciiz "\n"

.text
.globl main

main:
    li   $s0, 0
    li   $s1, 0
    li   $s2, 0
    li   $s3, 0

loop:
    li   $v0, 4
    la   $a0, msg_n
    syscall
    li   $v0, 5
    syscall
    move $t0, $v0

    bltz $t0, exibir

    bgt  $t0, 100, invalido

    bgt  $t0, 25, testa2
    addi $s0, $s0, 1
    j    loop

testa2:
    bgt  $t0, 50, testa3
    addi $s1, $s1, 1
    j    loop

testa3:
    bgt  $t0, 75, testa4
    addi $s2, $s2, 1
    j    loop

testa4:
    addi $s3, $s3, 1
    j    loop

invalido:
    li   $v0, 4
    la   $a0, msg_inv
    syscall
    j    loop

exibir:
    li   $v0, 4
    la   $a0, msg_i1
    syscall
    li   $v0, 1
    move $a0, $s0
    syscall
    li   $v0, 4
    la   $a0, msg_nl
    syscall

    li   $v0, 4
    la   $a0, msg_i2
    syscall
    li   $v0, 1
    move $a0, $s1
    syscall
    li   $v0, 4
    la   $a0, msg_nl
    syscall

    li   $v0, 4
    la   $a0, msg_i3
    syscall
    li   $v0, 1
    move $a0, $s2
    syscall
    li   $v0, 4
    la   $a0, msg_nl
    syscall

    li   $v0, 4
    la   $a0, msg_i4
    syscall
    li   $v0, 1
    move $a0, $s3
    syscall
    li   $v0, 4
    la   $a0, msg_nl
    syscall

    li   $v0, 10
    syscall
