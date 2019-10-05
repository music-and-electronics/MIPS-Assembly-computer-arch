#selection_sort
selection_sort:
    

sort: 
    beq  $a0, $a1, done        #if $a0, $a1 is equal goto "done"
    jal  max                   #goto "max"
    lw   $t0, 0($a1)           #load value of $a1 into $t0
    sw   $t0, 0($v0)           #store value of $t0 into $v0
    sw   $v1, 0($a1)           #store value of $a1 into $v1
    addi $a1, $a1, -4          #add -4 into $a1
    j    sort                  #goto "sort"

done:
    


max:
    addi $v0, $a0, 0           #add address of $a0 to $v0 (initialize pointer)
    lw   $v1, 0($v0)           #load value of $v0 into $v1
    addi $t0, $a0, 0           #add address of $a0 into $t0

sort_loop:
    beq  $t0, $a0, return      #if $t0 == $a0 goto "return"
    addi $t0, $t0, 4           #add 4 into $t0
    lw   $t1, 0($t0)           #load value of $t0 into $t1
    slt  $t2, $t1, $v1         #if $t1 < $v1 store 1 into $t2
    bne  $t2, $zero, sort_loop #if $t2 != 0 goto "sort_loop"
    addi $v0, $t0, 0           #store address of $t0 into $v0
    addi $v1, $t1, 0           #store address of $t1 into $v1
    j    sort_loop             #goto "sort_loop"            

return:
    jr $ra