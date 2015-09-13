	.file	"dfs.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d\n"
	.text
	.p2align 4,,15
	.type	dfs_traversal.constprop.1, @function
dfs_traversal.constprop.1:
.LFB66:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movslq	%edi, %r12
	salq	$4, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	addq	$G, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	cmpb	$0, 12(%r12)
	je	.L12
.L1:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L12:
	.cfi_restore_state
	movl	$10, %edi
	call	putchar
	movl	8(%r12), %edx
	xorl	%eax, %eax
	movl	$.LC0, %esi
	movl	$1, %edi
	call	__printf_chk
	movq	16(%r12), %rbp
	movb	$1, 12(%r12)
	testq	%rbp, %rbp
	je	.L1
	.p2align 4,,10
	.p2align 3
.L9:
	movl	G(%rip), %ecx
	movl	0(%rbp), %esi
	testl	%ecx, %ecx
	jle	.L3
	xorl	%eax, %eax
	cmpl	G+8(%rip), %esi
	movl	$G+24, %edx
	jne	.L4
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L5:
	addq	$16, %rdx
	cmpl	-16(%rdx), %esi
	je	.L8
.L4:
	addl	$1, %eax
	cmpl	%ecx, %eax
	jne	.L5
.L3:
	movl	%ebx, %edi
	call	dfs_traversal.constprop.1
	movq	8(%rbp), %rbp
	testq	%rbp, %rbp
	jne	.L9
.L14:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L8:
	.cfi_restore_state
	movl	%eax, %ebx
	movl	%ebx, %edi
	call	dfs_traversal.constprop.1
	movq	8(%rbp), %rbp
	testq	%rbp, %rbp
	jne	.L9
	jmp	.L14
.L15:
	xorl	%ebx, %ebx
	movl	%ebx, %edi
	call	dfs_traversal.constprop.1
	movq	8(%rbp), %rbp
	testq	%rbp, %rbp
	jne	.L9
	jmp	.L14
	.cfi_endproc
.LFE66:
	.size	dfs_traversal.constprop.1, .-dfs_traversal.constprop.1
	.section	.rodata.str1.1
.LC1:
	.string	"No memory!"
.LC2:
	.string	" "
.LC3:
	.string	"%d -> "
.LC4:
	.string	"%d "
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB65:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	$G, %esi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	call	__isoc99_scanf
	movl	$G+12, %eax
	.p2align 4,,10
	.p2align 3
.L17:
	movb	$0, (%rax)
	movq	$0, 4(%rax)
	addq	$16, %rax
	cmpq	$G+16012, %rax
	jne	.L17
	movl	G(%rip), %edx
	testl	%edx, %edx
	jle	.L18
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L27:
	movl	$100, %edi
	call	malloc
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L45
	movq	stdin(%rip), %rcx
	movl	$1000, %edx
	movl	$100, %esi
	movq	%rax, %rdi
	call	__fgets_chk
	movq	%rbx, %rdx
.L20:
	movl	(%rdx), %ecx
	addq	$4, %rdx
	leal	-16843009(%rcx), %eax
	notl	%ecx
	andl	%ecx, %eax
	andl	$-2139062144, %eax
	je	.L20
	movl	%eax, %ecx
	shrl	$16, %ecx
	testl	$32896, %eax
	cmove	%ecx, %eax
	leaq	2(%rdx), %rcx
	cmove	%rcx, %rdx
	addb	%al, %al
	sbbq	$3, %rdx
	subl	%ebx, %edx
	testl	%edx, %edx
	jle	.L22
	movslq	%edx, %rdx
	leaq	-1(%rbx,%rdx), %rax
	cmpb	$10, (%rax)
	je	.L46
.L22:
	movslq	current_node_id.3271(%rip), %r12
	movl	$.LC2, %esi
	movq	%rbx, %rdi
	call	strtok
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%rax, %rdi
	call	strtol
	salq	$4, %r12
	movl	%eax, G+8(%r12)
	.p2align 4,,10
	.p2align 3
.L43:
	xorl	%edi, %edi
	movl	$.LC2, %esi
	call	strtok
	testq	%rax, %rax
	je	.L24
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%rax, %rdi
	call	strtol
	movl	$16, %edi
	movq	%rax, %r13
	call	malloc
	leaq	G(%r12), %rdx
	movl	%r13d, (%rax)
	movb	$0, 4(%rax)
	movq	16(%rdx), %rcx
	testq	%rcx, %rcx
	je	.L47
	movq	%rcx, 8(%rax)
	movq	%rax, 16(%rdx)
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L47:
	movq	$0, 8(%rax)
	movq	%rax, 16(%rdx)
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L24:
	movq	%rbx, %rdi
	addl	$1, current_node_id.3271(%rip)
	addl	$1, %ebp
	call	free
	movl	G(%rip), %eax
	cmpl	%eax, %ebp
	jl	.L27
	testl	%eax, %eax
	jle	.L18
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L30:
	movslq	%ebp, %rax
	movl	$.LC3, %esi
	movl	$1, %edi
	salq	$4, %rax
	movq	G+16(%rax), %rbx
	movl	G+8(%rax), %edx
	xorl	%eax, %eax
	call	__printf_chk
	testq	%rbx, %rbx
	je	.L28
	.p2align 4,,10
	.p2align 3
.L36:
	movl	(%rbx), %edx
	xorl	%eax, %eax
	movl	$.LC4, %esi
	movl	$1, %edi
	call	__printf_chk
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L36
.L28:
	movl	$10, %edi
	addl	$1, %ebp
	call	putchar
	cmpl	G(%rip), %ebp
	jl	.L30
.L18:
	xorl	%edi, %edi
	call	dfs_traversal.constprop.1
	movl	G(%rip), %eax
	testl	%eax, %eax
	jle	.L31
	movl	$G+16, %r12d
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L34:
	movq	(%r12), %rdi
	testq	%rdi, %rdi
	jne	.L44
	jmp	.L32
	.p2align 4,,10
	.p2align 3
.L35:
	movq	%rbx, %rdi
.L44:
	movq	8(%rdi), %rbx
	call	free
	testq	%rbx, %rbx
	jne	.L35
.L32:
	addl	$1, %ebp
	addq	$16, %r12
	cmpl	G(%rip), %ebp
	jl	.L34
.L31:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L46:
	.cfi_restore_state
	movb	$0, (%rax)
	jmp	.L22
.L45:
	movl	$1, %edi
	movl	$.LC1, %esi
	xorl	%eax, %eax
	call	__printf_chk
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE65:
	.size	main, .-main
	.comm	G,16008,32
	.local	current_node_id.3271
	.comm	current_node_id.3271,4,4
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
