#test 1

.data
question:	.asciiz "\nPlease enter an integer value less than 100 (a):"
message:	.asciiz "\nThe random number (b) is:"
question2:	.asciiz "\nWhat is a-b?:"
correctans:	.asciiz "\nGreat job"
wrongans:	.asciiz "\nSorry, wrong answer"



.text
main:
	la $a0, question #a. print question
	li $v0, 4
	syscall
	
	la $a0, ($t1) #b. read int
	li $v0, 5
	syscall
	move $t0, $v0  
	
	li $v0, 42 #c. generate rand num
	li $a1, 100
	syscall
	move $s3, $a0
	
	la $a0, message #d. print rand num message
	li $v0, 4
	syscall
	
	la $a0, 0($s3) #e. print rand num
	li $v0, 1
	syscall
	
	sub $t1, $t0, $s3 #f subtract (a-b)
	
	la $a0, question2 #ask user for a-b
	li $v0, 4
	syscall
	
 	li $v0, 5 #g. read user answer
	syscall
	move $t3, $v0
	
	bne $t3, $t1, wrong
	la $a0, correctans #i. correct result 
	li $v0, 4
	syscall
	jal 	main

wrong:
	la $a0, wrongans #j. wrong result 
	li $v0, 4
	syscall
	jal 	main
	
		
	
	
	
	
	
	