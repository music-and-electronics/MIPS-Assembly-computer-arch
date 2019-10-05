.data
string1:
    .asciiz "Helloworld:"
    .text

main:
    li		$v0,4 	
    
    la		$a0, string1	
    syscall

    li $v0,8
    move $s2,$a0
    syscall

    li $v0,4
    la $a2,($s2)
    syscall

    li		$v0, 10	
    syscall