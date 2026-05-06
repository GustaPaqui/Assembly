.data
    msg_bmai:  .asciiz "Base maior: "
    msg_bmen:  .asciiz "Base menor: "
    msg_alt:   .asciiz "Altura: "
    msg_area:  .asciiz "Area do trapezio: "
    msg_nl:    .asciiz "\n"

.text
.globl main

main:
    
    li   $v0, 4
    la   $a0, msg_bmai
    syscall
    li   $v0, 5
    syscall
    move $s0, $v0          

    
    li   $v0, 4
    la   $a0, msg_bmen
    syscall
    li   $v0, 5
    syscall
    move $s1, $v0          

    
    li   $v0, 4
    la   $a0, msg_alt
    syscall
    li   $v0, 5
    syscall
    move $s2, $v0         

    
    add  $t0, $s0, $s1     

    mult $t0, $s2
    mflo $t1               

    srl  $s3, $t1, 1       

    
    li   $v0, 4
    la   $a0, msg_area
    syscall
    li   $v0, 1
    move $a0, $s3
    syscall
    li   $v0, 4
    la   $a0, msg_nl
    syscall

    
    li   $v0, 10
    syscall