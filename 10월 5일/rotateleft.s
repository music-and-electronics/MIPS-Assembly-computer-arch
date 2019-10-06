
.data
line1: .word 4
.text
.globl main

main:
    addi $t0, $zero, 36
    la   $t1, line1
    rol  $s1,$t1,$t0
    li   $v0,10
