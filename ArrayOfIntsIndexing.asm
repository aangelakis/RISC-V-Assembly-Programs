	$Alexandros Angelakis
	#csd4334
	
	#register x20 we store the elements of the arr
	#register x5 starting pointer 
	#register x18 initialisation of i=1
	#register x19 size of array
	
		
	.data 
	
 str:	.asciz "----------------------"
 str1:	.asciz "Type 8 integers in 8 lines:"
 newl:	.asciz "\n"
 space:	.asciz " "
 	.align 2
 a:	.space 32
 
 	.text
 main:
 	la x5, a
 	addi x17, x0, 4
 	la x10, str1
 	ecall
 	addi x17, x0, 4
 	la x10, newl
 	ecall
 	addi x18, x0, 0
 	addi x19, x0, 8
 loop:	
 	addi x17, x0, 5
 	ecall
 	#add x20, x10, x0
 	sw x10, 0(x5)
 	addi x18, x18, 1	# i++
 	addi x5, x5, 4
 	bne x19, x18, loop
 	addi x17, x0, 4 	#printing ---------
 	la x10, str
 	ecall
 	addi x17, x0, 4		#printing a new line
 	la x10, newl
 	ecall	
 	
 	addi x18, x0, 0
 	addi x19, x0, 8
 loop1: 
 	lw x21, -4(x5)
 	add x22, x21, x21	# multiply every element *6	
 	add x23, x22, x22	# multiply every element *6
 	add x21, x22, x23	# multiply every element *6
 	addi x17, x0, 1
 	add x10, x21, x0
 	ecall
 	addi x17, x0, 4
 	la x10, space
 	ecall 
 	addi x5, x5, -4
 	addi x18, x18, 1 	# i++
 	bne x19, x18, loop1
 	
 	addi x17, x0, 4 #printing a new line
 	la x10, newl
 	ecall
 	
 	j main
