	.file	"main.c"
	.section .rdata,"dr"
LC0:
	.ascii "r\0"
LC1:
	.ascii "%s\0"
	.text
	.globl	_DA_transformer
	.def	_DA_transformer;	.scl	2;	.type	32;	.endef
_DA_transformer:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$152, %esp
	movl	$LC0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	leal	-128(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fscanf
	leal	-128(%ebp), %eax
	movl	%eax, (%esp)
	call	_atoi
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	sall	$2, %eax
	movl	%eax, (%esp)
	call	_malloc
	movl	%eax, -24(%ebp)
	movl	$0, -12(%ebp)
	jmp	L2
L3:
	leal	-128(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fscanf
	leal	-128(%ebp), %eax
	movl	%eax, (%esp)
	call	_atoi
	movl	%eax, -28(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-24(%ebp), %eax
	addl	%eax, %edx
	movl	-28(%ebp), %eax
	movl	%eax, (%edx)
	addl	$1, -12(%ebp)
L2:
	movl	-12(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jle	L3
	movl	-24(%ebp), %eax
	leave
	ret
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	call	___main
	call	_asm_function
	movl	$0, %eax
	leave
	ret
	.ident	"GCC: (GNU) 6.4.0"
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_fscanf;	.scl	2;	.type	32;	.endef
	.def	_atoi;	.scl	2;	.type	32;	.endef
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_asm_function;	.scl	2;	.type	32;	.endef
