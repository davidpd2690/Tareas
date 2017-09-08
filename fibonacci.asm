.data

.text

main:

	addi $s0, $zero, 6	# n = 6	
	add $a0, $zero, $s0	# se carga arg para calcular fibonacci con valor de n
	
	bgt $a0, 1, fibonacci
	jr $ra

			
fibonacci:

	addi $sp, $sp, -12	# aparta espacio en stack
	sw $ra, 0($sp)		# guarda $ra en stack
	
	sw $a0, 4($sp)		# guarda $a0 en stack
	addi $a0, $a0, -1	# n - 1
	jal fibonacci
	
	lw $a0, 4($sp)		# recupera valor de a0 guardado en stack
	sw $v0, 8($sp)		# guarda fib(n - 1) en stack
	
	addi $a0,$a0, -2	# n - 2
	jal fibonacci
	
	lw $t0, 8($sp)		# recupera el valor de fib(n - 1), guarda en  reg temporal t0
	add $v0, $t0, $v0	# fib(n-1) + fib(n-2)
	
	lw $ra, 0($sp)		# recupera $ra
	add $sp, $sp, 12	# regresa espacio al stack
	jr $ra
