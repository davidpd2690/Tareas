.data 

MatA:   .word 	1 -3 5 7 9 0 2 -4 6 8 1 3 -1 0 1 0 0 0 -5 7 9 0 1 0
MatB:   .word 	0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
Result: .word 	0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0


.text 

addi $t8, $zero, 4		# for iloop comparison
addi $t7, $zero, 3		# for jloop comparison

la $a1, MatA
la $a2, MatB
la $a3, Result

jal matrixOp

j exit

matrixOp:

addi $sp, $sp, -24
sw $s0, 0($sp)
sw $s1, 4($sp)
sw $t0, 8($sp)
sw $t1, 12($sp)
sw $s0, 16($sp)
sw $s1, 20($sp)

   add $s0, $zero, $zero		#int i = 0
 
   iloop:
   slt $t0, $s0, $a0			# if s0 < a0; t0 = 1
   bne $t0, 1, iloopexit

             add $s1, $zero, $zero		#int j = 0
             jloop:
	slt $t1, $s1, $a1			# if s1 < a1; t1 = 1
	bne $t1, 1, jloopexit

	addi $s1,$s1,1		# j ++
	j jloop

            jloopexit:

   addi $s0, $s0, 1		# i ++
   j iloop

  iloopexit:

lw $s0, 0($sp)
lw $s1, 4($sp)
lw $t0, 8($sp)
lw $t1, 12($sp)
lw $s0, 16($sp)
lw $s1, 20($sp)
addi $sp, $sp, 24

jr $ra

exit:

