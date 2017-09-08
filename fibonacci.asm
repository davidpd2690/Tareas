.data

.text

main:

	addi $a0, $zero, 6	# n = 6	
	#add $a0, $zero, $s0	
	jal fibonacci
	move $a1, $v0	# save return value to a1

			
fibonacci:

	addi $sp, $sp, -12	# reserve space in stack for 3 regs
	sw $ra, 0($sp)		# store $ra	in stack
	sw $s0, 4($sp)		# store $s0	in stack
	sw $s1, 8($sp)		# store $s1	in stack
	
	add $s0, $zero, $a0	#s0 = a0 = n
	li $v0, 1		#return value for base condition
	
	blt $s0, 2, fibExit		#if (n<2) jump to fibExit

	addi $a0, $s0, -1	# s0 = n-1
	jal fibonacci
	
	add $s1,$zero, $v0	# s1 = f(n-1)
	add $a0, $s0, -2	# s0 = n-2
	jal fibonacci
	
	add $v0, $s1, $v0	#f(n-1)+f(n-2)
	
fibExit:	
	lw $ra, 0($sp)		# load $ra from stack
	lw $a0, 4($sp)		# load a0 from stack
	lw $s0, 8($sp)		# 
	addi $sp, $sp, 12	# restore space in stack
	jr $ra
	
	