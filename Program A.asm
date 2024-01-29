.data
	myString: .asciiz "This is Lab 3 exercise \n"
	

.text
	li	$s1,0x20736920
	la	$s3,0x10010000
repeat:
	xori	$s2,$s1,0x20736920
	lw	$s4,4($s3)
	bne	$s4,$s1,repeat
	sb	$s2,4($s3)
	li	$v0,10
	syscall

