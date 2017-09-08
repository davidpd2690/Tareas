.data

.text

main:

	addi $s0, $zero, 6	# n = 6	
	add $a0, $zero, $s0	# se carga arg para calcular fibonacci con valor de n
	
	jal fibonacci
	jr $ra
	
	j exit
			
fibonacci:

	addi $sp, $sp, -12	# reserve space in stack for 3 regs
	sw $ra, 0($sp)		# store $ra	in stack
	sw $a0, 4($sp)		# store $a0	in stack
	sw $s0, 8($sp)		# store $s0	in stack
	
	blt $s0, 2, one		#if (n<2) jump to one
	
	addi $s0, $s0, -1	# n - 1	
	
	addi $t0,$s0, -2	# n - 2
	jal fibonacci
	
	
	add $v0, $t0, $s0	# fib(n-1) + fib(n-2)
	
	lw $ra, 0($sp)		# load $ra from stack
	lw $a0, 4($sp)		# load a0 from stack
	lw $t0, 8($sp)		# 
	add $sp, $sp, 12	# restore space in stack
	jr $ra
	
	j exit
	
one:

	add $v0, $zero, $s0	# return n
	j exit
	
exit: