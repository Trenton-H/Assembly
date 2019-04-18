###############################################################################
# Example program to illustrate some aspects of doing functions following the
# function call convention discussed in class
# A MIPS translation of an accompanying C++ program
###############################################################################
			.text
			.globl main
###############################################################################
# int main()
###############################################################################
# Register usage:
#################
# $t0: holder for a value that needs to be in a register
# $v0: sum = return value
###############################################################################
main:
# prolog:
			addiu $sp, $sp, -88
			sw $ra, 84($sp)
			sw $fp, 80($sp)
			addiu $fp, $sp, 88
# body:
			j begDataInit				# "clutter-reduction" jump
endDataInit:

			# cout << outLabel
			li $v0, 4
			addi $a0, $sp, 24
			syscall
			# cout << Sum3Arrays(a1, 2, a2, 3, a3, 4)
			addi $a0, $sp, 44			# 1st_arg: &a1[0] via register
			li $a1, 2					# 2nd_arg: size1 via register
			addi $a2, $sp, 52			# 3rd_arg: &a2[0] via register
			li $a3, 3					# 4th_arg: size2 via register
			addi $t0, $sp, 64			# $t0 has &a3[0]
			sw $t0, 16($sp)				# 5th_arg: &a3[0] via stack
			li $t0, 4					# $t0 has size3
			sw $t0, 20($sp)				# 6th_arg: size3 via stack
			jal Sum3Arrays
			move $a0, $v0				# return value to be displayed
			li $v0, 1
			syscall
			# cout << endl
			li $v0, 11
			li $a0, '\n'
			syscall
# epilog:
			lw $fp, 80($sp)
			lw $ra, 84($sp)
			addiu $sp, $sp, 88
# exit code:			
			li $v0, 10
			syscall

###############################################################################
# int SumArray(int a[], int size)
###############################################################################
# Register usage:
#################
# $t0: holder for a value that needs to be in a register
# $t5: i
# $v0: sum = return value
###############################################################################
SumArray:
# prolog:
			# no stack frame needed
# body:
			sw $a0, 0($sp)				# save $a0 (= &a[0]) in caller's frame

			# sum = 0
			li $v0, 0
			# i = 0
			li $t5, 0
			# goto forTest
			j forTest
begFor:
			# sum = sum + a[i]
			lw $a0, 0($sp)				# reset $a0 to &a[0] as received
			sll $t5, $t5, 2				# temporarily scale i 4 times
			add $a0, $a0, $t5			# $a0 now has &a[i]
			srl $t5, $t5, 2				# restore i
			lw $t0, 0($a0)				# $t0 now has a[i]
			add $v0, $v0, $t0
			# ++i
			addi $t5, $t5, 1
forTest:
			# if (i < size) goto begFor
			blt $t5, $a1, begFor
			
			# return sum
# epilog:
			jr $ra

###############################################################################
# int Sum2Arrays(int a1[], int size1, int a2[], int size2)
###############################################################################
# Register usage:
#################
# $t0: holder for a value that needs to be in a register
# $t5: i
# $s0: sum1
# $t2: sum2
# $v0: sum12 = return value
###############################################################################
Sum2Arrays:
# prolog:
			addiu $sp, $sp, -32
			sw $ra, 28($sp)
			sw $fp, 24($sp)
			addiu $fp, $sp, 32
			sw $s0, 0($sp)				# save $s0 (callee-saved)
# body:
			sw $a0, 0($fp)				# save $a0 (= &a1[0]) in caller's frame
			sw $a2, 8($fp)				# save $a2 (= &a2[0]) in caller's frame
			
			# sum1 = 0
			li $s0, 0
			# i = 0
			li $t5, 0
			# goto forTest1
			j forTest1
begFor1:
			# sum1 = sum1 + a1[i]
			lw $a0, 0($fp)				# reset $a0 to &a1[0] as received
			sll $t5, $t5, 2				# temporarily scale i 4 times
			add $a0, $a0, $t5			# $a0 now has &a1[i]
			srl $t5, $t5, 2				# restore i
			lw $t0, 0($a0)				# $t0 now has a1[i]
			add $s0, $s0, $t0
			# ++i
			addi $t5, $t5, 1
forTest1:
			# if (i < size1) goto begFor1
			blt $t5, $a1, begFor1
			
			# sum2 = 0
			li $t2, 0
			# i = 0
			li $t5, 0
			# goto forTest2
			j forTest2
begFor2:
			# sum2 = sum2 + a2[i]
			lw $a2, 8($fp)				# reset $a2 to &a2[0] as received
			sll $t5, $t5, 2				# temporarily scale i 4 times
			add $a2, $a2, $t5			# $a2 now has &a2[i]
			srl $t5, $t5, 2				# restore i
			lw $t0, 0($a2)				# $t0 now has a2[i]
			add $t2, $t2, $t0
			# ++i
			addi $t5, $t5, 1
forTest2:
			# if (i < size2) goto begFor2
			blt $t5, $a3, begFor2

			# sum12 = sum1 + sum2
			# return sum12
# epilog:
			add $v0, $s0, $t2
			lw $s0, 0($sp)				# restore $s0 (callee-saved)
			lw $fp, 24($sp)
			lw $ra, 28($sp)
			addiu $sp, $sp, 32
			jr $ra

###############################################################################
# int Sum3Arrays(int a1[], int size1, int a2[], int size2, int a3[], int size3)
###############################################################################
# Register usage:
#################
# $s0: sum3
# $t1: sum12
# $v0: sum123 = return value
###############################################################################
Sum3Arrays:
# prolog:
			addiu $sp, $sp, -32
			sw $ra, 28($sp)
			sw $fp, 24($sp)
			addiu $fp, $sp, 32
			sw $s0, 16($sp)				# save $s0 (callee-saved)
# body:

			sw $a0, 32($sp)				# save $a0 (= &a1[0]) in caller's frame
			sw $a1, 36($sp)				# save $a1 (= size1) in caller's frame
			sw $a2, 40($sp)				# save $a2 (= &a2[0]) in caller's frame
			sw $a3, 44($sp)				# save $a3 (= size2) in caller's frame
			# if elect to use $fp instead $sp
			# sw $a0, 0($fp)			# save $a0 (= &a1[0]) in caller's frame
			# sw $a1, 4($fp)			# save $a1 (= size1) in caller's frame
			# sw $a2, 8($fp)			# save $a2 (= &a2[0]) in caller's frame
			# sw $a3, 12($fp)			# save $a3 (= size2) in caller's frame
			
			# sum3 = SumArray(a3, size3)
			lw $a0, 48($sp)				# 1st_arg: a3 received as 5th_arg via stack
			lw $a1, 52($sp)				# 2nd_arg: size3 received as 6th_arg via stack
			jal SumArray
			move $s0, $v0
			
			# sum12 = Sum2Arrays(a1, size1, a2, size2)
			lw $a0, 32($sp)				# 1st_arg: reload $a0 w/ &a1[0] as received
			lw $a1, 36($sp)				# 2nd_arg: reload $a1 w/ size1 as received
			lw $a2, 40($sp)				# 3rd_arg: reload $a2 w/ &a2[0] as received
			lw $a3, 44($sp)				# 4th_arg: reload $a3 w/ size2 as received
			# if elect to use $fp instead $sp
			# lw $a0, 0($fp)			# 1st_arg: reload $a0 w/ &a1[0] as received
			# lw $a1, 4($fp)			# 2nd_arg: reload $a1 w/ size1 as received
			# lw $a2, 8($fp)			# 3rd_arg: reload $a2 w/ &a2[0] as received
			# lw $a3, 12($fp)			# 4th_arg: reload $a3 w/ size2 as received
			jal Sum2Arrays
			move $t1, $v0
			
			# sum123 = sum12 + sum3
			# return sum123
# epilog:
			add $v0, $t1, $s0
			lw $s0, 16($sp)				# restore $s0 (callee-saved)
			lw $fp, 24($sp)
			lw $ra, 28($sp)
			addiu $sp, $sp, 32
			jr $ra

###############################################################################
# main's string initialization code moved out of the way to reduce clutter
###############################################################################
begDataInit:
			# load outLabel
			li $t0, '3'
			sb $t0, 24($sp)
			li $t0, '-'
			sb $t0, 25($sp)
			li $t0, 'a'
			sb $t0, 26($sp)
			sb $t0, 29($sp)
			li $t0, 'r'
			sb $t0, 27($sp)
			sb $t0, 28($sp)
			li $t0, 'y'
			sb $t0, 30($sp)
			li $t0, ' '
			sb $t0, 31($sp)
			sb $t0, 35($sp)
			sb $t0, 37($sp)
			li $t0, 's'
			sb $t0, 32($sp)
			li $t0, 'u'
			sb $t0, 33($sp)
			li $t0, 'm'
			sb $t0, 34($sp)
			li $t0, '='
			sb $t0, 36($sp)
			li $t0, '\0'
			sb $t0, 38($sp)
			# load a1
			li $t0, 11
			sw $t0, 44($sp)				# a1[0] = 11
			li $t0, 12
			sw $t0, 48($sp)				# a1[1] = 12
			# load a2
			li $t0, 21
			sw $t0, 52($sp)				# a2[0] = 21
			li $t0, 22
			sw $t0, 56($sp)				# a2[1] = 22
			li $t0, 23
			sw $t0, 60($sp)				# a2[2] = 23
			# load a3
			li $t0, 31
			sw $t0, 64($sp)				# a3[0] = 31
			li $t0, 32
			sw $t0, 68($sp)				# a3[1] = 32
			li $t0, 33
			sw $t0, 72($sp)				# a3[2] = 33
			li $t0, 34
			sw $t0, 76($sp)				# a3[3] = 34
			
			j endDataInit
###############################################################################
