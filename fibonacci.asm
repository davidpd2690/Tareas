.data

.text

main:

	addi $s0, $zero, 6	# n = 6	
	add $a0, $zero, $s0	# se carga arg para calcular fibonacci con valor de n
	
	jal fibonacci
	jr $ra
	
	j exit
			
fibonacci:

	addi $sp, $sp, -12	# aparta espacio en stack
	sw $ra, 0($sp)		# guarda $ra en stack
	sw $a0, 4($sp)		# guarda $a0 en stack
	sw $s0, 8($sp)		# guarda fib(n - 1) en stack
	
	blt $s0, 2, one		#if (n<2) jump to one
	
	addi $s0, $s0, -1	# n - 1
	
	addi $t0,$s0, -2	# n - 2
	jal fibonacci
	
	
	add $v0, $t0, $s0	# fib(n-1) + fib(n-2)
	
	lw $ra, 0($sp)		# recupera $ra
	lw $a0, 4($sp)		# recupera valor de a0 guardado en stack
	lw $t0, 8($sp)		# 
	add $sp, $sp, 12	# regresa espacio al stack
	jr $ra
	
	j exit
	
one:

	add $v0, $zero, $s0	# return n
	j exit
	
exit: