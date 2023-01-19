	.file	"main2.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%d"
	.text
	.globl	input_min
	.type	input_min, @function
out_put:
	push	rbp
	push	r12		#N 
	push	r13		#b
	push	r14		#i 
	mov	rbp, rsp
	mov	r12, rdi		#int N
	mov	r13, rsi		#int *b
	mov	r14, 0		#int i = 0
	jmp	.L7
.L8:
	mov	rax, r14
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, r13
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	printf@PLT			#printf b[i]
	add	r14, 1
.L7:
	mov	rax, r14
	cmp	rax, r12
	jl	.L8
	mov	rsp, rbp
	pop	r14				#void function
	pop	r13
	pop	r12
	pop	rbp
	ret
	.size	out_put, .-out_put
	.globl	task
	.type	task, @function
task:
	push	rbp
	push	r12			#a
	push	r13			#b
	push	r14			#mi
	push	r15			#N
	push	rbx			# i
	mov	rbp, rsp
	mov	r12, rdi		#int *a
	mov	r13, rsi		#int *b
	mov	r14, rdx		#int mi
	mov	r15, rcx		#int N
	mov	rbx, 0		#int i = 0
	jmp	.L10
.L13:
	mov	rax, rbx
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, r12
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	test	eax, eax
	jne	.L11
	mov	rax, rbx
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, r13
	add	rdx, rax
	mov	rax, r14
	mov	DWORD PTR [rdx], eax
	jmp	.L12
.L11:
	mov	rax, rbx
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, r12
	add	rax, rdx
	mov	rdx, rbx
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	mov	rdx, r13
	add	rdx, rcx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR [rdx], eax
.L12:
	add	rbx, 1
.L10:
	mov	rax, rbx
	cmp	rax, r15
	jl	.L13
	mov	rsp, rbp
	pop	rbx						#void function
	pop	r15
	pop	r14
	pop	r13
	pop	r12
	pop	rbp
	ret
	.size	task, .-task
	.section	.rodata
.LC2:
	.string	"incorrect input"
	.text
	.globl	main
	.type	main, @function
input_min:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi
	mov	QWORD PTR -32[rbp], rsi
	mov	DWORD PTR -4[rbp], 1000000
	mov	DWORD PTR -8[rbp], 0
	jmp	.L2
.L4:
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	rsi, rax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	cmp	DWORD PTR -4[rbp], eax
	jle	.L3
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR -4[rbp], eax
.L3:
	add	DWORD PTR -8[rbp], 1
.L2:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L4
	mov	eax, DWORD PTR -4[rbp]
	leave
	ret
	.size	input_min, .-input_min
	.section	.rodata
.LC1:
	.string	"%d "
	.text
	.globl	out_put
	.type	out_put, @function
main:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 88
	mov	rax, rsp
	mov	rbx, rax
	mov	DWORD PTR -60[rbp], 1000000	#mi 	
	mov	DWORD PTR -92[rbp], 0		# N 
	lea	rax, -92[rbp]
	mov	rsi, rax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -92[rbp]		#save scan N
	test	eax, eax
	jns	.L15
	lea	rdi, .LC2[rip]			#incorrect input
	mov	eax, 0
	call	printf@PLT
.L15:
	mov	eax, DWORD PTR -92[rbp]
	cdqe
	sal	rax, 2
	mov	rdx, rax
	sub	rdx, 1
	mov	QWORD PTR -56[rbp], rdx
	mov	QWORD PTR -112[rbp], rax
	mov	QWORD PTR -104[rbp], 0
	mov	QWORD PTR -128[rbp], rax
	mov	QWORD PTR -120[rbp], 0
	sal	rax, 2				#int a[N*sizeof(int)]
	lea	rdx, 3[rax]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	ecx, 16
	mov	edx, 0
	div	rcx
	imul	rax, rax, 16
	sub	rsp, rax
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -72[rbp], rax
	mov	rdx, QWORD PTR -72[rbp]		#N to input_min
	mov	eax, DWORD PTR -92[rbp]		#a to input_min
	mov	rsi, rdx
	mov	edi, eax
	call	input_min
	mov	DWORD PTR -60[rbp], eax		#save mi from func
	mov	eax, DWORD PTR -92[rbp]
	cdqe
	sal	rax, 2				#int b[N*sizeof(int)]
	mov	rdx, rax
	sub	rdx, 1
	mov	QWORD PTR -80[rbp], rdx
	mov	r14, rax
	mov	r15d, 0
	mov	r12, rax
	mov	r13d, 0
	sal	rax, 2
	lea	rdx, 3[rax]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	ecx, 16
	mov	edx, 0
	div	rcx
	imul	rax, rax, 16
	sub	rsp, rax
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -88[rbp], rax
	mov	ecx, DWORD PTR -92[rbp]		#a to task
	mov	rsi, QWORD PTR -88[rbp]		#b to task
	mov	rax, QWORD PTR -72[rbp]		#mi to task
	mov	edx, DWORD PTR -60[rbp]		#N to task
	mov	rdi, rax
	call	task				#void 
	mov	rdx, QWORD PTR -88[rbp]		#N to out
	mov	eax, DWORD PTR -92[rbp]		#b to out
	mov	rsi, rdx
	mov	edi, eax
	call	out_put				#void
	mov	eax, 0
	mov	rsp, rbx
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
