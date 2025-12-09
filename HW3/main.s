	.file	"main.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "A\0"
.LC1:
	.ascii "B\0"
.LC2:
	.ascii "A*B+A\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$224, %rsp
	.seh_stackalloc	224
	.seh_endprologue
	call	__main
	movl	$1, -48(%rbp)
	movl	$2, -44(%rbp)
	movl	$3, -40(%rbp)
	movl	$4, -36(%rbp)
	movl	$5, -32(%rbp)
	movl	$6, -28(%rbp)
	movl	$7, -24(%rbp)
	movl	$8, -20(%rbp)
	movl	$9, -16(%rbp)
	movl	$1, -96(%rbp)
	movl	$2, -92(%rbp)
	movl	$0, -88(%rbp)
	movl	$3, -84(%rbp)
	movl	$4, -80(%rbp)
	movl	$5, -76(%rbp)
	movl	$0, -72(%rbp)
	movl	$6, -68(%rbp)
	movl	$7, -64(%rbp)
	pxor	%xmm0, %xmm0
	movups	%xmm0, -144(%rbp)
	movups	%xmm0, -128(%rbp)
	movd	%xmm0, -112(%rbp)
	leaq	.LC0(%rip), %rdx
	leaq	-48(%rbp), %rax
	movl	$1, %r8d
	movq	%rax, %rcx
	call	printMatrix
	leaq	.LC1(%rip), %rdx
	leaq	-96(%rbp), %rax
	movl	$1, %r8d
	movq	%rax, %rcx
	call	printMatrix
	leaq	-96(%rbp), %rcx
	leaq	-48(%rbp), %rdx
	leaq	-144(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	matmult
	movq	-144(%rbp), %rax
	movq	-136(%rbp), %rdx
	movq	%rax, -192(%rbp)
	movq	%rdx, -184(%rbp)
	movq	-128(%rbp), %rax
	movq	-120(%rbp), %rdx
	movq	%rax, -176(%rbp)
	movq	%rdx, -168(%rbp)
	movl	-112(%rbp), %eax
	movl	%eax, -160(%rbp)
	leaq	-48(%rbp), %rcx
	leaq	-192(%rbp), %rdx
	leaq	-144(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	matadd
	leaq	.LC2(%rip), %rdx
	leaq	-144(%rbp), %rax
	movl	$1, %r8d
	movq	%rax, %rcx
	call	printMatrix
	movl	$0, %eax
	addq	$224, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	matmult
	.def	matmult;	.scl	2;	.type	32;	.endef
	.seh_proc	matmult
matmult:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	clearResult
	movl	$0, -4(%rbp)
	jmp	.L4
.L9:
	movl	$0, -8(%rbp)
	jmp	.L5
.L8:
	movl	$0, -12(%rbp)
	jmp	.L6
.L7:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	movl	-8(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %r8d
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	addq	%rax, %rdx
	movl	-12(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %ecx
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	32(%rbp), %rax
	addq	%rax, %rdx
	movl	-8(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	imull	%eax, %ecx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	addl	%r8d, %ecx
	movl	-8(%rbp), %eax
	cltq
	movl	%ecx, (%rdx,%rax,4)
	addl	$1, -12(%rbp)
.L6:
	cmpl	$2, -12(%rbp)
	jle	.L7
	addl	$1, -8(%rbp)
.L5:
	cmpl	$2, -8(%rbp)
	jle	.L8
	addl	$1, -4(%rbp)
.L4:
	cmpl	$2, -4(%rbp)
	jle	.L9
	nop
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	matadd
	.def	matadd;	.scl	2;	.type	32;	.endef
	.seh_proc	matadd
matadd:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	clearResult
	movl	$0, -4(%rbp)
	jmp	.L11
.L14:
	movl	$0, -8(%rbp)
	jmp	.L12
.L13:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	addq	%rax, %rdx
	movl	-8(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %r8d
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	32(%rbp), %rax
	addq	%rax, %rdx
	movl	-8(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %ecx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	addl	%r8d, %ecx
	movl	-8(%rbp), %eax
	cltq
	movl	%ecx, (%rdx,%rax,4)
	addl	$1, -8(%rbp)
.L12:
	cmpl	$2, -8(%rbp)
	jle	.L13
	addl	$1, -4(%rbp)
.L11:
	cmpl	$2, -4(%rbp)
	jle	.L14
	nop
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	clearResult
	.def	clearResult;	.scl	2;	.type	32;	.endef
	.seh_proc	clearResult
clearResult:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L16
.L19:
	movl	$0, -8(%rbp)
	jmp	.L17
.L18:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	movl	-8(%rbp), %eax
	cltq
	movl	$0, (%rdx,%rax,4)
	addl	$1, -8(%rbp)
.L17:
	cmpl	$2, -8(%rbp)
	jle	.L18
	addl	$1, -4(%rbp)
.L16:
	cmpl	$2, -4(%rbp)
	jle	.L19
	nop
	nop
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC3:
	.ascii "%s = \0"
.LC4:
	.ascii "   \0"
.LC5:
	.ascii "[\0"
.LC6:
	.ascii "|\0"
.LC7:
	.ascii " %d\0"
.LC8:
	.ascii " ]\12\0"
.LC9:
	.ascii " |\12\0"
	.text
	.globl	printMatrix
	.def	printMatrix;	.scl	2;	.type	32;	.endef
	.seh_proc	printMatrix
printMatrix:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$88, %rsp
	.seh_stackalloc	88
	leaq	80(%rsp), %rbp
	.seh_setframe	%rbp, 80
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movl	%r8d, %eax
	movb	%al, 48(%rbp)
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L21
.L28:
	movl	$0, -12(%rbp)
	jmp	.L22
.L27:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	32(%rbp), %rax
	addq	%rax, %rdx
	movl	-12(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, -16(%rbp)
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	32(%rbp), %rax
	addq	%rax, %rdx
	movl	-12(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	movl	%eax, %edx
	negl	%edx
	cmovns	%edx, %eax
	movl	%eax, -20(%rbp)
	jmp	.L23
.L24:
	addl	$1, -16(%rbp)
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$1717986919, %rdx, %rdx
	shrq	$32, %rdx
	movl	%edx, %ecx
	sarl	$2, %ecx
	cltd
	movl	%ecx, %eax
	subl	%edx, %eax
	movl	%eax, -20(%rbp)
.L23:
	cmpl	$0, -20(%rbp)
	jg	.L24
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	32(%rbp), %rax
	addq	%rax, %rdx
	movl	-12(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	testl	%eax, %eax
	jns	.L25
	addl	$1, -16(%rbp)
.L25:
	movl	-16(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jle	.L26
	movl	-16(%rbp), %eax
	movl	%eax, -4(%rbp)
.L26:
	addl	$1, -12(%rbp)
.L22:
	cmpl	$2, -12(%rbp)
	jle	.L27
	addl	$1, -8(%rbp)
.L21:
	cmpl	$2, -8(%rbp)
	jle	.L28
	movl	$0, -24(%rbp)
	jmp	.L29
.L49:
	cmpb	$0, 48(%rbp)
	je	.L30
	movq	40(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L30
	cmpl	$1, -24(%rbp)
	jne	.L30
	movq	40(%rbp), %rax
	leaq	.LC3(%rip), %rcx
	movq	%rax, %rdx
	call	printf
.L30:
	cmpl	$0, -24(%rbp)
	je	.L31
	cmpl	$2, -24(%rbp)
	jne	.L32
.L31:
	movl	$1, %eax
	jmp	.L33
.L32:
	movl	$0, %eax
.L33:
	movb	%al, -45(%rbp)
	andb	$1, -45(%rbp)
	cmpb	$0, -45(%rbp)
	je	.L34
	cmpb	$0, 48(%rbp)
	je	.L34
	movq	40(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L34
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$0, -28(%rbp)
	jmp	.L35
.L36:
	movl	$32, %ecx
	call	putchar
	addl	$1, -28(%rbp)
.L35:
	movl	-28(%rbp), %eax
	movslq	%eax, %rbx
	movq	40(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	cmpq	%rax, %rbx
	jb	.L36
.L34:
	cmpb	$0, -45(%rbp)
	je	.L37
	leaq	.LC5(%rip), %rax
	jmp	.L38
.L37:
	leaq	.LC6(%rip), %rax
.L38:
	movq	%rax, %rcx
	call	printf
	movl	$0, -32(%rbp)
	jmp	.L39
.L46:
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	32(%rbp), %rax
	addq	%rax, %rdx
	movl	-32(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	leaq	.LC7(%rip), %rcx
	movl	%eax, %edx
	call	printf
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	32(%rbp), %rax
	addq	%rax, %rdx
	movl	-32(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	testl	%eax, %eax
	jne	.L40
	movl	$1, -36(%rbp)
	jmp	.L41
.L40:
	movl	$0, -36(%rbp)
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	32(%rbp), %rax
	addq	%rax, %rdx
	movl	-32(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	movl	%eax, %edx
	negl	%edx
	cmovns	%edx, %eax
	movl	%eax, -40(%rbp)
	jmp	.L42
.L43:
	addl	$1, -36(%rbp)
	movl	-40(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$1717986919, %rdx, %rdx
	shrq	$32, %rdx
	movl	%edx, %ecx
	sarl	$2, %ecx
	cltd
	movl	%ecx, %eax
	subl	%edx, %eax
	movl	%eax, -40(%rbp)
.L42:
	cmpl	$0, -40(%rbp)
	jg	.L43
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	32(%rbp), %rax
	addq	%rax, %rdx
	movl	-32(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	testl	%eax, %eax
	jns	.L41
	addl	$1, -36(%rbp)
.L41:
	movl	$0, -44(%rbp)
	jmp	.L44
.L45:
	movl	$32, %ecx
	call	putchar
	addl	$1, -44(%rbp)
.L44:
	movl	-4(%rbp), %eax
	subl	-36(%rbp), %eax
	cmpl	%eax, -44(%rbp)
	jl	.L45
	addl	$1, -32(%rbp)
.L39:
	cmpl	$2, -32(%rbp)
	jle	.L46
	cmpb	$0, -45(%rbp)
	je	.L47
	leaq	.LC8(%rip), %rax
	jmp	.L48
.L47:
	leaq	.LC9(%rip), %rax
.L48:
	movq	%rax, %rcx
	call	printf
	addl	$1, -24(%rbp)
.L29:
	cmpl	$2, -24(%rbp)
	jle	.L49
	nop
	nop
	addq	$88, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev8, Built by MSYS2 project) 15.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	putchar;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
