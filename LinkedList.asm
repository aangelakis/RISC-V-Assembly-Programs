							#Alexandros Angelakis
							#csd4334
							#assignment 7	
	.data
space:  .asciz	" "
str1:	.asciz "\n Give a number to compare with \n"
	.align 2
	
	.text
main:
				#creating the dummy node
 	jal ra, node_alloc
	sw x0, 0(x10) #data = 0 
	sw x0, 4(x10) #pointer = 0
	add s0, x0, x10 #first node
	add s1, x0, x10 #last node
	
loop1: 				#creating the linked list	
	jal ra, read_int
	beq a4, x0, second_part
	slt t6, a4, x0
	bne t6, x0, second_part
	jal ra, node_alloc
	sw a4, 0(x10)
	sw x0, 4(x10)
	sw x10, 4(s1) 		#ptr = nextptr | now s1 has the address of the new node;
	add s1, x10, x0
	j loop1

second_part:			#second part
	addi x17, x0, 4
	la x10, str1
	ecall
	jal ra, read_int
	add s1, a0, x0		#t2 = the number we're gonna compare our list with
	blt s1, x0, exit
	add s2, s0, x0		#s2 = pointer for printing --> now it points to the head of the linked list
	jal ra, search_list
	j second_part
				
exit:  
	addi x17, x0, 10
	ecall

read_int: 
	addi x17, x0, 5
	ecall	
	add a4, x10, x0
	jr ra	
			
node_alloc:
	addi x17, x0, 9
	addi x10, x0, 8
	ecall 
	jr ra
	
print_node:
	lw t5, 0(a0)	
	bge a1, t5, nothing
	
	addi x17, x0, 1
	add x10, x0, t5
	ecall
	addi x17, x0, 4
	la x10, space
	ecall

nothing:
	jr ra

search_list:	
	#s2->head s1->input
	beq s2, x0, return
	add a0, x0, s2
	add a1, x0, s1
	addi sp, sp, -4
	sw ra, 0(sp)
	jal ra, print_node
	lw ra, 0(sp)
	addi sp, sp, 4
	lw s3, 4(s2)	#s3 = pointer segment s3 = s2->next
	add s2, s3, x0 #s2 = s3->next
	j search_list
	
return:
	jr ra
	

