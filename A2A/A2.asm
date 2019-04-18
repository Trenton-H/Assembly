# Trenton Hohle
# CS2318-004
# Assignment 2 Part 1 Program A			
			
			.data
eaiPrompt:		.asciiz "Enter an integer: "
dtiLabel:		.asciiz "Integer entered: "
easPrompt:		.asciiz "Enter a string: "
dtsLabel:		.asciiz "String Entered: "
tempString:		.space 31 #Makes that string variable hold 30 values plus the null
eacPrompt:		.asciiz "Enter a character: "
dacLabel:		.asciiz "Character entered: "

			.text
			.globl main
main:
			li $v0, 4
			la $a0, eaiPrompt	#asks for an integer
			syscall
			li $v0, 5
			syscall
			move $t1, $v0
			li $v0, 4
			la $a0, dtiLabel
			syscall
			li $v0, 1
			move $a0, $t1
			syscall
			li $v0, 11		#add a new line
			li $a0, '\n'
			syscall

			
			li $v0, 4
			la $a0, easPrompt	#asks for a string
			syscall
			li $v0, 8
			la $a0, tempString	
			li $a1, 31
			syscall		
			li $v0, 4
			la $a0, dtsLabel	#Display the string
			syscall
			la $a0, tempString
			syscall
			
			la $a0, eacPrompt
			syscall
			li $v0, 12
			syscall
			move $t2, $v0
			li $v0, 11
			li $a0, '\n'
			syscall
			li $v0, 4
			la $a0, dacLabel
			syscall
			li $v0, 11
			move $a0, $t2
			syscall
			li $v0, 11		#add a new line
			li $a0, '\n'
			syscall			

			li $v0, 10 		#End Program
			syscall
			
