main:
	jal outer_procedure
	
outer_procedure:
	sub $sp, $sp, 12
	sw $ra, 8($sp)
	sw $s0, 4($sp)
	move $s0, $a0
	jal inner_procedure
	move $a0, $s0
	lw $s0, 4($sp)
	lw $ra, 8($sp)
	add $sp, $sp, 12
	jr $ra
	
inner_procedure:
	sub $sp, $sp, 8
	sw $ra, 4($sp)
	lw $ra, 4($sp)
	add $sp, $sp, 8
	jr $ra