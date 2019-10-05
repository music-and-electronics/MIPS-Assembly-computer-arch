.data
string1:
        .asciiz "data1: "

stirng2:
        .asciiz "result data: "
.text

main:
        li		$v0, 4		# $v0 =4 
        la		$a0, string1		# 
        syscall

        li              $v0,5
        syscall

        move            $t0,$v0

        li		$v0, 4		# $v0 =4 
        la		$a0, stirng2		# 
        syscall

        li              $v0,1
        move            $a0,$t0
        syscall

        li $v0,10