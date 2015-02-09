	.file	"battleFinal.c"
	.text
	.globl	buildBoard
	.type	buildBoard, @function
buildBoard:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L2
.L5:
	movl	$0, -4(%rbp)
	jmp	.L3
.L4:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	movl	$-1, (%rax,%rdx,4)
	addl	$1, -4(%rbp)
.L3:
	cmpl	$4, -4(%rbp)
	jle	.L4
	addl	$1, -8(%rbp)
.L2:
	cmpl	$4, -8(%rbp)
	jle	.L5
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	buildBoard, .-buildBoard
	.section	.rodata
.LC0:
	.string	" X |"
.LC1:
	.string	" Y |"
.LC2:
	.string	" O |"
.LC3:
	.string	" x |"
.LC4:
	.string	" M |"
.LC5:
	.string	" H |"
.LC6:
	.string	" 0 |"
.LC7:
	.string	" 1 |"
.LC8:
	.string	"   1   2   3   4   5 "
.LC9:
	.string	" *-------------------*"
.LC10:
	.string	"%d|"
.LC11:
	.string	"   |"
.LC12:
	.string	"%s"
.LC13:
	.string	"\n *-------------------*"
.LC14:
	.string	"\n |---|---|---|---|---|"
	.text
	.globl	displayBoard
	.type	displayBoard, @function
displayBoard:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movq	$.LC0, -24(%rbp)
	movq	$.LC1, -16(%rbp)
	cmpl	$1, -44(%rbp)
	jne	.L7
	movq	$.LC2, -24(%rbp)
	movq	$.LC3, -16(%rbp)
	jmp	.L8
.L7:
	cmpl	$2, -44(%rbp)
	jne	.L9
	movq	$.LC4, -24(%rbp)
	movq	$.LC5, -16(%rbp)
	jmp	.L8
.L9:
	cmpl	$3, -44(%rbp)
	jne	.L8
	movq	$.LC6, -24(%rbp)
	movq	$.LC7, -16(%rbp)
.L8:
	movl	$0, -8(%rbp)
	jmp	.L10
.L19:
	cmpl	$0, -8(%rbp)
	jne	.L11
	movl	$.LC8, %edi
	call	puts
	movl	$.LC9, %edi
	call	puts
.L11:
	movl	-8(%rbp), %eax
	leal	1(%rax), %edx
	movl	$.LC10, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	$0, -4(%rbp)
	jmp	.L12
.L16:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	-40(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	cmpl	$-1, %eax
	jne	.L13
	movl	$.LC11, %eax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	jmp	.L14
.L13:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	-40(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	testl	%eax, %eax
	jne	.L15
	movl	$.LC12, %eax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	jmp	.L14
.L15:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	-40(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	cmpl	$1, %eax
	jne	.L14
	movl	$.LC12, %eax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
.L14:
	addl	$1, -4(%rbp)
.L12:
	cmpl	$4, -4(%rbp)
	jle	.L16
	cmpl	$4, -8(%rbp)
	jne	.L17
	movl	$.LC13, %edi
	call	puts
	jmp	.L18
.L17:
	movl	$.LC14, %edi
	call	puts
.L18:
	addl	$1, -8(%rbp)
.L10:
	cmpl	$4, -8(%rbp)
	jle	.L19
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	displayBoard, .-displayBoard
	.globl	makeShips
	.type	makeShips, @function
makeShips:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	movq	%rdi, -40(%rbp)
	movl	$0, %edi
	.cfi_offset 3, -24
	call	time
	movl	%eax, %edi
	call	srand
	movl	$0, -24(%rbp)
	jmp	.L21
.L26:
	movl	-24(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rbx
	addq	-40(%rbp), %rbx
	call	rand
	movl	%eax, %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	%ecx, %edx
	subl	%eax, %edx
	movl	%edx, (%rbx)
	movl	-24(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rbx
	addq	-40(%rbp), %rbx
	call	rand
	movl	%eax, %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	%ecx, %edx
	subl	%eax, %edx
	movl	%edx, 4(%rbx)
	movl	$0, -20(%rbp)
	jmp	.L22
.L25:
	movl	-24(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	-40(%rbp), %rax
	movl	(%rax), %edx
	movl	-20(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	-40(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jne	.L23
	movl	-24(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	-40(%rbp), %rax
	movl	4(%rax), %edx
	movl	-20(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	-40(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	%eax, %edx
	jne	.L23
.L24:
	movl	-24(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rbx
	addq	-40(%rbp), %rbx
	call	rand
	movl	%eax, %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	%ecx, %edx
	subl	%eax, %edx
	movl	%edx, (%rbx)
	movl	-24(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rbx
	addq	-40(%rbp), %rbx
	call	rand
	movl	%eax, %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	%ecx, %edx
	subl	%eax, %edx
	movl	%edx, 4(%rbx)
	movl	-24(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	-40(%rbp), %rax
	movl	(%rax), %edx
	movl	-20(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	-40(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jne	.L23
	movl	-24(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	-40(%rbp), %rax
	movl	4(%rax), %edx
	movl	-20(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	-40(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	%eax, %edx
	je	.L24
.L23:
	addl	$1, -20(%rbp)
.L22:
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jl	.L25
	addl	$1, -24(%rbp)
.L21:
	cmpl	$2, -24(%rbp)
	jle	.L26
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	makeShips, .-makeShips
	.section	.rodata
	.align 8
.LC15:
	.string	"Enter 0 at any time to restart or exit."
	.text
	.globl	shoot
	.type	shoot, @function
shoot:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	movq	%rdi, -24(%rbp)
	movl	$.LC15, %edi
	.cfi_offset 3, -24
	call	puts
	movl	$0, %eax
	call	theRow
	movq	-24(%rbp), %rdx
	movl	%eax, (%rdx)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	leal	-1(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	movq	-24(%rbp), %rax
	leaq	4(%rax), %rbx
	movl	$0, %eax
	call	column
	movl	%eax, (%rbx)
	movq	-24(%rbp), %rax
	addq	$4, %rax
	movl	(%rax), %edx
	subl	$1, %edx
	movl	%edx, (%rax)
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	shoot, .-shoot
	.section	.rodata
	.align 8
.LC16:
	.string	"Enter the row you would like to target: "
.LC17:
	.string	"%d"
	.align 8
.LC18:
	.string	"\n Would you like to reset or exit? (1 for Reset, Any key for Exit) "
.LC19:
	.string	"Thanks for playing!"
	.align 8
.LC20:
	.string	"Out of range! You must choose between 1 and 5."
	.align 8
.LC21:
	.string	"Not an integer! Please enter a number"
	.text
	.globl	theRow
	.type	theRow, @function
theRow:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$.LC16, %eax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	$.LC17, %eax
	leaq	-12(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	%eax, -4(%rbp)
	cmpl	$1, -4(%rbp)
	jne	.L29
	movl	-12(%rbp), %eax
	testl	%eax, %eax
	jne	.L30
	movl	$.LC18, %eax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	$.LC17, %eax
	leaq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	-8(%rbp), %eax
	cmpl	$1, %eax
	jne	.L31
	movl	$0, %eax
	call	main
	jmp	.L30
.L31:
	movl	$.LC19, %edi
	call	puts
	movl	$0, %edi
	call	exit
.L30:
	movl	-12(%rbp), %eax
	cmpl	$5, %eax
	jg	.L32
	movl	-12(%rbp), %eax
	testl	%eax, %eax
	jg	.L33
.L32:
	movl	$.LC20, %edi
	call	puts
	call	getchar
	movl	$0, %eax
	call	theRow
	movl	%eax, -12(%rbp)
	jmp	.L33
.L29:
	movl	$.LC21, %edi
	call	puts
	call	getchar
	movl	$0, %eax
	call	theRow
	movl	%eax, -12(%rbp)
.L33:
	movl	-12(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	theRow, .-theRow
	.section	.rodata
	.align 8
.LC22:
	.string	"Enter the column you would like to target: "
	.text
	.globl	column
	.type	column, @function
column:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$.LC22, %eax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	$.LC17, %eax
	leaq	-12(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	%eax, -4(%rbp)
	cmpl	$1, -4(%rbp)
	jne	.L35
	movl	-12(%rbp), %eax
	testl	%eax, %eax
	jne	.L36
	movl	$.LC18, %eax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	$.LC17, %eax
	leaq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	-8(%rbp), %eax
	cmpl	$1, %eax
	jne	.L37
	movl	$0, %eax
	call	main
	jmp	.L36
.L37:
	movl	$.LC19, %edi
	call	puts
	movl	$0, %edi
	call	exit
.L36:
	movl	-12(%rbp), %eax
	cmpl	$5, %eax
	jg	.L38
	movl	-12(%rbp), %eax
	testl	%eax, %eax
	jg	.L39
.L38:
	movl	$.LC20, %edi
	call	puts
	movl	$0, %eax
	call	column
	movl	%eax, -12(%rbp)
	jmp	.L39
.L35:
	movl	$.LC21, %edi
	call	puts
	call	getchar
	movl	$0, %eax
	call	column
	movl	%eax, -12(%rbp)
.L39:
	movl	-12(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	column, .-column
	.section	.rodata
.LC23:
	.string	"Boom (%d,%d)\n"
	.text
	.globl	hit
	.type	hit, @function
hit:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L41
.L44:
	movq	-24(%rbp), %rax
	movl	(%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	-32(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jne	.L42
	movq	-24(%rbp), %rax
	addq	$4, %rax
	movl	(%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	-32(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	%eax, %edx
	jne	.L42
	movq	-24(%rbp), %rax
	addq	$4, %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %ecx
	movl	$.LC23, %eax
	movl	%ecx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	$1, %eax
	jmp	.L43
.L42:
	addl	$1, -4(%rbp)
.L41:
	cmpl	$2, -4(%rbp)
	jle	.L44
	movl	$0, %eax
.L43:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	hit, .-hit
	.section	.rodata
.LC24:
	.string	"clear"
.LC25:
	.string	"You have %d attempts left.\n"
	.align 8
.LC26:
	.string	"\nTurn %d: \nRow %d : %d ships\nColumn %d : %d ships\n"
	.text
	.globl	tip
	.type	tip, @function
tip:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	%ecx, -40(%rbp)
	movl	$.LC24, %edi
	call	system
	movl	$0, -12(%rbp)
	movl	$0, -8(%rbp)
	movl	-36(%rbp), %eax
	movl	-40(%rbp), %edx
	subl	%eax, %edx
	movl	$.LC25, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	$0, -4(%rbp)
	jmp	.L46
.L49:
	movl	-4(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	-32(%rbp), %rax
	movl	(%rax), %edx
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jne	.L47
	addl	$1, -12(%rbp)
.L47:
	movl	-12(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	-32(%rbp), %rax
	movl	4(%rax), %edx
	movq	-24(%rbp), %rax
	addq	$4, %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jne	.L48
	addl	$1, -8(%rbp)
.L48:
	addl	$1, -4(%rbp)
.L46:
	cmpl	$2, -4(%rbp)
	jle	.L49
	movq	-24(%rbp), %rax
	addq	$4, %rax
	movl	(%rax), %eax
	leal	1(%rax), %r8d
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edi
	movl	-36(%rbp), %eax
	leal	1(%rax), %esi
	movl	$.LC26, %eax
	movl	-8(%rbp), %ecx
	movl	-12(%rbp), %edx
	movl	%ecx, %r9d
	movl	%edx, %ecx
	movl	%edi, %edx
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	tip, .-tip
	.globl	refreshBoard
	.type	refreshBoard, @function
refreshBoard:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	hit
	testl	%eax, %eax
	je	.L51
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	addq	$4, %rdx
	movl	(%rdx), %edx
	movslq	%edx, %rdx
	movl	$1, (%rax,%rdx,4)
	jmp	.L50
.L51:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	addq	$4, %rdx
	movl	(%rdx), %edx
	movslq	%edx, %rdx
	movl	$0, (%rax,%rdx,4)
.L50:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	refreshBoard, .-refreshBoard
	.section	.rodata
.LC27:
	.string	"Welcome to BattleShip!"
.LC28:
	.string	"******** GAME SETUP ********"
	.align 8
.LC29:
	.string	"How would you like hits to be represented\n1) X\n2) H\n3) 1\n4) Y\n "
	.align 8
.LC30:
	.string	"Enter option (1-4) or any key to exit:"
	.align 8
.LC31:
	.string	"\nEnter the maximum number of attempts allowed:"
	.align 8
.LC32:
	.string	"Number too small; Please enter another number:"
.LC33:
	.string	"Game Over!"
	.align 8
.LC34:
	.string	"\n Would you like to try again? (1 for Yes, Any key for No) "
	.align 8
.LC35:
	.string	"\n Mazel Tov! You hit all 3 ships in %d attempts\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$176, %rsp
	movl	$0, -20(%rbp)
	movl	$.LC24, %edi
	call	system
	movl	$.LC27, %edi
	call	puts
	movl	$.LC28, %edi
	call	puts
	movl	$.LC29, %eax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	$.LC30, %eax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	$.LC17, %eax
	leaq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	%eax, -4(%rbp)
	call	getchar
	movl	$.LC31, %eax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	jmp	.L54
.L56:
	movl	$.LC17, %eax
	leaq	-20(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	%eax, -4(%rbp)
	cmpl	$1, -4(%rbp)
	jne	.L55
	movl	-20(%rbp), %eax
	cmpl	$3, %eax
	jg	.L55
	movl	$0, -20(%rbp)
	movl	$.LC32, %eax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
.L55:
	call	getchar
.L54:
	movl	-20(%rbp), %eax
	testl	%eax, %eax
	je	.L56
	movl	-24(%rbp), %eax
	cmpl	$1, %eax
	je	.L57
	movl	-24(%rbp), %eax
	cmpl	$2, %eax
	je	.L57
	movl	-24(%rbp), %eax
	cmpl	$3, %eax
	je	.L57
	movl	-24(%rbp), %eax
	cmpl	$4, %eax
	jne	.L58
.L57:
	movl	$.LC24, %edi
	call	system
	movl	$0, -12(%rbp)
	movl	$0, -8(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, %rdi
	call	buildBoard
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	makeShips
	movl	-20(%rbp), %eax
	movl	%eax, %edx
	subl	-12(%rbp), %edx
	movl	$.LC25, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	$10, %edi
	call	putchar
.L63:
	movl	-24(%rbp), %edx
	leaq	-176(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	displayBoard
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	shoot
	addl	$1, -12(%rbp)
	leaq	-64(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	hit
	testl	%eax, %eax
	je	.L59
	movl	-20(%rbp), %ecx
	movl	-12(%rbp), %edx
	leaq	-64(%rbp), %rsi
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	tip
	addl	$1, -8(%rbp)
	jmp	.L60
.L59:
	movl	-20(%rbp), %ecx
	movl	-12(%rbp), %edx
	leaq	-64(%rbp), %rsi
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	tip
.L60:
	leaq	-176(%rbp), %rdx
	leaq	-64(%rbp), %rcx
	leaq	-32(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	refreshBoard
	movl	-20(%rbp), %eax
	cmpl	%eax, -12(%rbp)
	jne	.L61
	movl	$.LC33, %edi
	call	puts
	movl	$.LC34, %eax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	$.LC17, %eax
	leaq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	-16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L62
	movl	$0, %eax
	call	main
	jmp	.L61
.L62:
	movl	$.LC19, %edi
	call	puts
	movl	$0, %edi
	call	exit
.L61:
	cmpl	$3, -8(%rbp)
	jne	.L63
	movl	$.LC35, %eax
	movl	-12(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	-24(%rbp), %edx
	leaq	-176(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	displayBoard
	movl	$.LC34, %eax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	$.LC17, %eax
	leaq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	-16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L64
	movl	$0, %eax
	call	main
	nop
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L64:
	.cfi_restore_state
	movl	$.LC19, %edi
	call	puts
	movl	$0, %edi
	call	exit
.L58:
	movl	$.LC19, %edi
	call	puts
	movl	$0, %edi
	call	exit
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
