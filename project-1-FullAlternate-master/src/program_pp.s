# 1 "asm.S"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "asm.S"
# 1 "asmdef.h" 1
# 2 "asm.S" 2

.globl _asm_function; .def _asm_function; .scl 2; .type 32; .endef


################################################################################
# name: asm_function
# action:
# in:

# out:
# modifies:
# notes:
################################################################################
_asm_function:

 # Enters function asm_function
 pushl %ebp
 movl %esp, %ebp
 subl $16, %esp # Allocates 16 bytes of space in stack

 movl $2, -4(%ebp) # localvar 1 = 2
 movl $4, -8(%ebp) # localvar 2 = 4
 movl $6, -12(%ebp) # localvar 3 = *array

 movl -4(%ebp), %ecx # i = 2

 # while ((i*i)) <= array_length)
 loop_one:
  movl %ecx, %eax # a = 2
  imull %ecx, %eax # a = i * i
  cmpl 12(%ebp), %eax # a <= array_length
  jle _loop_one_end

  # (array[i] != 0)
  movl -12(%ebp), %ebx # b = array[]
  imull -8(%ebp), %ebx # d =


 loop_one_end:


 popl %ebp
 ret
