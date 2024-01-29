# Program Name: String Reverse
# Description: this program reverse 8 character string from user input.

# .data section
		.data 
# Define your data variables here using directives like .word, .byte, etc.
hellomsg:	.asciiz "Welcome, this program is to reverse a given input string\n "
prompt: 	.asciiz "Please enter a valid input string (exacly 8 characters)\n "
endl:		.asciiz " \n"
msg: 		.asciiz "The reverse string is: "
input:		.space 9
output:		.space 9

# .text section
		.text
		
# Main program code starts here

#1.	Step 1
#Print out a message string with a welcome message "Welcome! This program is to reverse a given input string\n"
	la	$a0, hellomsg
	jal PrintString

#2.	Step 2
#Print out a message string with the message "Please enter a valid input string (exacly 8 characters) "
	li	$v0, 4
	la	$a0, prompt
	syscall

#3.	Step 3
#Get an input from the user to enter an input (string) exactly 8 characters.
	li	$v0, 8
	la	$a0, input
	li	$a1, 9
	syscall

#4.	Step 4
#Do the process to reverse the input string.

		la $a1, output
		
		addi $a3, $a0, 7 #get last address
		li $t0, 0
		

#5.	Step 5
#Print out 1 character at a time, 1 character in one line, the next character in another line.

	reverse: 

		li	$v0, 4 
		la	$a0, endl
		syscall
		li $v0, 11


		lb $a0, 0($a3)
		sb $a0, 0($a1)
		syscall
		subi $a3, $a3, 1
		
		addi $t0, $t0, 1
		addi $a1, $a1, 1

#6.	Step 6
#If there are more characters in the, then go to step 5.
		beq $t0, 8, exit
		j reverse
	
	exit: 
		li	$v0, 4
		la	$a0, endl
		syscall
		
				
#7.	Step 7
#Otherwise prompt the message “The reversed string is “, and print the whole reversed string.
	li	$v0, 4
	la	$a0, msg
	syscall
	
	li	$v0, 4
	la	$a0, output
	syscall
	
#8. End the code: Exit the program
   	li $v0, 10        # Load the exit syscall code
    	syscall           # Exit the program

# End of program

PrintString:
	li $v0, 4
	syscall
	jr	$ra
