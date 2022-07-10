	.file	"bubble.c"
	.globl	n
	.data
	.align 32
	.type	n, @object
	.size	n, 40
n:
	.long	2
	.long	4
	.long	1
	.long	5
	.long	3
	.long	8
	.long	9
	.long	7
	.long	6
	.long	0
	.text
	.globl	swap
	.type	swap, @function
swap:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	movl	12(%ebp), %eax
	movl	-4(%ebp), %edx
	movl	%edx, (%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	swap, .-swap
	.section	.rodata
.LC0:
	.string	"swap [%d<->%d]\n"
.LC1:
	.string	"after one sort:"
.LC2:
	.string	"%d\t"
	.text
	.globl	bubbleSort
	.type	bubbleSort, @function
bubbleSort:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$0, -20(%ebp)
	jmp	.L3
.L9:
	movl	$0, -16(%ebp)
	jmp	.L4
.L6:
	movl	-16(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %edx
	movl	-16(%ebp), %eax
	addl	$1, %eax
	leal	0(,%eax,4), %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	jle	.L5
	movl	-16(%ebp), %eax
	addl	$1, %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %edx
	movl	-16(%ebp), %eax
	leal	0(,%eax,4), %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movl	(%eax), %eax
	subl	$4, %esp
	pushl	%edx
	pushl	%eax
	pushl	$.LC0
	call	printf
	addl	$16, %esp
	movl	-16(%ebp), %eax
	addl	$1, %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	-16(%ebp), %eax
	leal	0(,%eax,4), %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	swap
	addl	$16, %esp
.L5:
	addl	$1, -16(%ebp)
.L4:
	movl	12(%ebp), %eax
	subl	-20(%ebp), %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jg	.L6
	subl	$12, %esp
	pushl	$.LC1
	call	puts
	addl	$16, %esp
	movl	$0, -12(%ebp)
	jmp	.L7
.L8:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC2
	call	printf
	addl	$16, %esp
	addl	$1, -12(%ebp)
.L7:
	cmpl	$9, -12(%ebp)
	jle	.L8
	subl	$12, %esp
	pushl	$10
	call	putchar
	addl	$16, %esp
	addl	$1, -20(%ebp)
.L3:
	movl	-20(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	.L9
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	bubbleSort, .-bubbleSort
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$20, %esp
	movl	$0, -12(%ebp)
	jmp	.L11
.L12:
	movl	-12(%ebp), %eax
	movl	n(,%eax,4), %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC2
	call	printf
	addl	$16, %esp
	addl	$1, -12(%ebp)
.L11:
	cmpl	$9, -12(%ebp)
	jle	.L12
	subl	$12, %esp
	pushl	$10
	call	putchar
	addl	$16, %esp
	subl	$8, %esp
	pushl	$10
	pushl	$n
	call	bubbleSort
	addl	$16, %esp
	movl	$0, -12(%ebp)
	jmp	.L13
.L14:
	movl	-12(%ebp), %eax
	movl	n(,%eax,4), %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC2
	call	printf
	addl	$16, %esp
	addl	$1, -12(%ebp)
.L13:
	cmpl	$9, -12(%ebp)
	jle	.L14
	subl	$12, %esp
	pushl	$10
	call	putchar
	addl	$16, %esp
	movl	$0, %eax
	movl	-4(%ebp), %ecx
	.cfi_def_cfa 1, 0
	leave
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.12) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
