.data
    msg_nome:   .asciiz "Nome do funcionario: "
    msg_hnorm:  .asciiz "Horas normais trabalhadas: "
    msg_hext:   .asciiz "Horas extras trabalhadas: "
    msg_desc:   .asciiz "Desconto (em reais): "
    msg_bruto:  .asciiz "Salario bruto:  R$ "
    msg_liq:    .asciiz "Salario liquido: R$ "
    msg_nl:     .asciiz "\n"

.text
.globl main

main:
    li   $v0, 4
    la   $a0, msg_hnorm
    syscall
    li   $v0, 5
    syscall
    move $s0, $v0        

    
    li   $v0, 4
    la   $a0, msg_hext
    syscall
    li   $v0, 5
    syscall
    move $s1, $v0       

    
    li   $v0, 4
    la   $a0, msg_desc
    syscall
    li   $v0, 5
    syscall
    move $s2, $v0          

    
    li   $t0, 10
    mult $s0, $t0
    mflo $t1              

    li   $t0, 15
    mult $s1, $t0
    mflo $t2               

    add  $s3, $t1, $t2     

    
    sub  $s4, $s3, $s2    

    
    li   $v0, 4
    la   $a0, msg_bruto
    syscall
    li   $v0, 1
    move $a0, $s3
    syscall
    li   $v0, 4
    la   $a0, msg_nl
    syscall

    
    li   $v0, 4
    la   $a0, msg_liq
    syscall
    li   $v0, 1
    move $a0, $s4
    syscall
    li   $v0, 4
    la   $a0, msg_nl
    syscall

    
    li   $v0, 10
    syscall