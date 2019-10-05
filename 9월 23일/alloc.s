.data
 stirng1:
    .asciiz"\n"
string2:
    .asciiz":"
.text

main:
    addi $s1, $zero, 5
    addi $s2, $zero, -4
    jal  alloc_memory
    jal  store
    jal  free_memory
    li   $v0,10
    syscall

alloc_memory:
    addi $t0, $zero, 0
    mult $s1, $s2
    mflo $t0
    addi $fp, $sp, 0
    add  $sp, $sp, $t0
    jr   $ra

store:
    addi $s3, $sp, 0
    addi $t0, $zero, 0
    addi $t1, $s1, 0
    addi $a3, $ra, 0
    jal  store_loop
    addi $ra, $a3, 0
    jr   $ra

store_loop:
    add  $t3, $t0, $t0
    add  $t3, $t3, $t3         #2i
    add  $s3, $s3, $t3         #$s2=mem[$sp+4i]
    sw   $t1, 0($s3)
    addi $t0, $t0, 1
    addi $t1, $t1, -1

    lw   $a0, 0($s3)
    li   $v0, 1
    syscall
    la   $a0, string2
    li   $v0, 4
    syscall
    la   $a0, stirng1
    li   $v0, 4
    syscall

    bne  $t0, $s1, store_loop
    jr   $ra 

free_memory:
    addi $sp, $fp, 0
    jr   $ra