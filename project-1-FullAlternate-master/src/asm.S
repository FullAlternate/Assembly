#include "asmdef.h"

DECLARE_GLOBAL(asm_function)


################################################################################
# name:          asm_function
# action:        
# in:            
#
# out:
# modifies:
# notes:
################################################################################
FUNC(asm_function):
	print:
	.ascii "%d\12\0" # "%d\n"
	.text

	# Enters function asm_function
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%edi
	subl	$24, %esp # Allocates 24 bytes of space in stack

	# WHILE ((i*i)) <= array_length)
	# ---------------------------------------------
	movl	$2, -4(%ebp) # localvar 1 (i) = 2
	loop_one:
		movl	-4(%ebp), %ecx # (I * i)
		movl	-4(%ebp), %eax # (i * I)
		imull	%ecx, %eax # a = (i * i)

		cmpl	12(%ebp), %eax # a <= array_length 
		jle	loop_one_end # (may be reverse jge)

		# IF (array[i] != 0)
		# ---------------------------------------
		movl	8(%ebp), %ebx # b = *array

		movl	%4, %edx # d = 4
		imull	%ecx, %edx # d = (i * 4) 

		addl	%edx, %ebx # b = array[i]
		
		cmpl	$0, (%ebx) # array[i] != 0
		jne	after_if_one

		# FOR (int k = 2; k < array_length; k++)
		# ----------------------------------------
		movl	$2, -8(%ebp) # localvar 2 (k) = 2
		
		loop_two:
			movl	-8(%ebp), %ecx # k = 2
			
			cmpl	12(%ebp), %ecx # k < array_length
			jb	loop_two_end
			
			# IF (nonprim > array_length)
			# -----------------------------------------------------------
			movl	%ecx, %edx # d = k
			imull	(%ebx), %edx # d = (array[i] * k)
			
			movl	%edx, -16(%ebp) # localvar 3 (nonprim) = array[i] * k
			movl	-16(%ebp), %eax # a = nonprim

			cmpl	12(%ebp), %eax # (nonprim > array_length)
			ja	loop_two_end

			# ELSE
			# -----------------------------------------
			movl	8(%ebp), %ebx # b = *array

			imull	$4, %eax # a = (nonprim * 4)
			
			addl	%eax, %ebx # b = array[nonprim]
			movl	$0, (%ebx) # array[nonprim] = 0
		
			incl	-8(%ebp) # k++
			jmp	loop_two
		loop_two_end:

		after_if_one:

		incl	-4(%ebp) # i++
		jmp	loop_one
	loop_one_end:
	
	# FOR (i = 2; i <= array_length; i++)
	# ----------------------------------------------
	movl	$2, -20(%ebp) # localvar 4 (i2) = 2
	loop_three:
		movl	-20(%ebp), %ecx # i = 2

		cmpl	12(%ebp), %ecx # i <= array_length
		jle loop_three_end

		# IF (array[i] != 0)
		# ---------------------------
		movl	8(%ebp), %ebx # b = *array

		movl	$4 , %edx # d = 4
		imull	%ecx, %edx # d = (i * 4)

		addl	%edx, %ebx # b = array[i]

		cmpl	%0, (%ebx) # array[i] != 0
		jne after_if_two

		# PRINTF("%d\n", array[i])
		# ------------------------
		movl	(%ebx), %edi 
		movl	$print, %esi
		call 	printf

		after_if_two:
		
		incl	-20(%ebp) # i++
		jmp	loop_three
	loop_three_end:
	
	movl	%esp, %ebp # Frees all memory on stack
	popl	%edi
	popl	%esi
	popl	%ebp


	