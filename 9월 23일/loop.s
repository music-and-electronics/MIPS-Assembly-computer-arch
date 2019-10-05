main:
    addi $s1, $zero, 0
    addi $s2, $zero, 4
    jal loop
    li $v0,10
    syscall
loop:
    beq $s1, $s2, endloop
    addi $s1, $s1, 1
    j loop
endloop:
    jr $ra
