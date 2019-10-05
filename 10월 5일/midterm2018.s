.data
ptr1: .word 2 2 3 1 0
ptr2: .word 4
ptr3: .asciiz " "
ptr4: .asciiz "\n"
.text
.globl main

main:
    la    $a0,ptr1
    la    $t0,ptr2
    lw    $t0,0($t0)
    sll   $t0,$t0,2
    addi  $t0,$t0,-4
    add   $a1,$a0,$t0
    jal   label1
    la    $a0,ptr4
    li    $v0,4
    syscall
    la    $a0,ptr1
    jal   label4
    jal   label1
    li    $v0,10
    syscall

label1:
    addi  $t0,$a0,0

label2:
    blt   $a1,$t0,label3

    lw    $a0, 0($t0)
    li    $v0,1
    syscall
    
    la    $a0,ptr3
    li    $v0,4
    syscall

    addi  $t0,$t0,4
    j     label2

label3:
    jr    $ra

label4:
    sw    $ra,-8($sp)
    sw    $a1,-4($sp)

label5:
    beq   $a0,$a1,label6
    jal   label7
    lw    $t0,0($a0)
    sw    $t0,0($v0)
    sw    $v1,0($a0)
    addi  $a0,$a0,4
    j     label5

label6:
    lw    $ra,-8($sp)
    lw    $a1,-4($sp)
    jr    $ra

label7:
    addi  $t0,$a0,0
    addi  $v0,$a0,0
    lw    $v1,0($a0)

label8:
    beq   $t0,$a1,label9
    addi  $t0,$t0,4
    lw    $t1,0($t0)
    slt   $t2,$t1,$v1
    beq   $t2,$zero,label8
    addi  $v0,$t0,0
    addi  $v1,$t1,0
    j     label8
label9:
    jr    $ra