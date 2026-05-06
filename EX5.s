.data
    msg_a:   .asciiz "Cateto A: "
    msg_b:   .asciiz "Cateto B: "
    msg_hip: .asciiz "Hipotenusa: "
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

    mtc1  $s0, $f0
    cvt.s.w $f0, $f0
    mtc1  $s1, $f1
    cvt.s.w $f1, $f1

    mul.s $f0, $f0, $f0
    mul.s $f1, $f1, $f1
    add.s $f2, $f0, $f1
    sqrt.s $f3, $f2

    li   $v0, 4
    la   $a0, msg_hip
    syscall
    li   $v0, 2
    mov.s $f12, $f3
    syscall

    li   $v0, 4
    la   $a0, msg_nl
    syscall

    li   $v0, 10
    syscall