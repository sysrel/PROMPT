	.text
	.file	"/home/tuba/Documents/experiments/driverVerification/PMGuided/models/sound/sound_model.bc"
	.globl	snd_card_new_PROSE
	.align	16, 0x90
	.type	snd_card_new_PROSE,@function
snd_card_new_PROSE:                     # @snd_card_new_PROSE
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$16, %rsp
	movq	%r9, %r14
	movl	%r8d, %r12d
	movq	%rdi, %r15
	leaq	-36(%rbp), %rdi
	movl	$4, %esi
	movq	$.L.str, %rdx
	callq	klee_make_symbolic
	xorl	%ebx, %ebx
	testl	%r12d, %r12d
	cmovnsl	%r12d, %ebx
	movslq	%ebx, %rdi
	addq	$2200, %rdi             # imm = 0x898
	movl	$21004480, %esi         # imm = 0x14080C0
	callq	__kmalloc
	movl	$-12, %ecx
	testq	%rax, %rax
	je	.LBB0_5
# BB#1:
	movl	-36(%rbp), %ecx
	testl	%ecx, %ecx
	js	.LBB0_5
# BB#2:
	testl	%ebx, %ebx
	jle	.LBB0_4
# BB#3:
	leaq	2200(%rax), %rcx
	movq	%rcx, 400(%rax)
.LBB0_4:
	leaq	416(%rax), %rcx
	movq	%rcx, 416(%rax)
	movq	%rcx, 424(%rax)
	movq	%r15, 1352(%rax)
	movq	%rax, (%r14)
	addq	$1360, %rax             # imm = 0x550
	movl	$1, %esi
	movq	%rax, %rdi
	callq	klee_set_metadata
	movl	-36(%rbp), %ecx
.LBB0_5:
	movl	%ecx, %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end0:
	.size	snd_card_new_PROSE, .Lfunc_end0-snd_card_new_PROSE

	.globl	__snd_device_register_PROSE
	.align	16, 0x90
	.type	__snd_device_register_PROSE,@function
__snd_device_register_PROSE:            # @__snd_device_register_PROSE
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	movq	%rdi, %rbx
	cmpl	$0, 24(%rbx)
	jne	.LBB1_4
# BB#1:
	movq	40(%rbx), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.LBB1_3
# BB#2:
	movq	%rbx, %rdi
	callq	*%rax
	testl	%eax, %eax
	js	.LBB1_5
.LBB1_3:
	movl	$1, 24(%rbx)
.LBB1_4:
	leaq	-12(%rbp), %rdi
	movl	$4, %esi
	movq	$.L.str.1, %rdx
	callq	klee_make_symbolic
	movl	-12(%rbp), %edi
	shrl	$31, %edi
	xorl	$1, %edi
	callq	klee_assume
	movl	-12(%rbp), %eax
.LBB1_5:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end1:
	.size	__snd_device_register_PROSE, .Lfunc_end1-__snd_device_register_PROSE

	.globl	snd_device_register_all_PROSE
	.align	16, 0x90
	.type	snd_device_register_all_PROSE,@function
snd_device_register_all_PROSE:          # @snd_device_register_all_PROSE
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movq	%rdi, %r14
	movl	$-6, %eax
	testq	%r14, %r14
	je	.LBB2_10
# BB#1:
	movq	416(%r14), %rbx
	addq	$416, %r14              # imm = 0x1A0
	cmpq	%r14, %rbx
	je	.LBB2_9
# BB#2:                                 # %.lr.ph
	leaq	-28(%rbp), %r15
	.align	16, 0x90
.LBB2_3:                                # =>This Inner Loop Header: Depth=1
	cmpl	$0, 24(%rbx)
	jne	.LBB2_7
# BB#4:                                 #   in Loop: Header=BB2_3 Depth=1
	movq	40(%rbx), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.LBB2_6
# BB#5:                                 #   in Loop: Header=BB2_3 Depth=1
	movq	%rbx, %rdi
	callq	*%rax
	testl	%eax, %eax
	js	.LBB2_10
.LBB2_6:                                #   in Loop: Header=BB2_3 Depth=1
	movl	$1, 24(%rbx)
.LBB2_7:                                # %__snd_device_register_PROSE.exit
                                        #   in Loop: Header=BB2_3 Depth=1
	movl	$4, %esi
	movq	$.L.str.1, %rdx
	movq	%r15, %rdi
	callq	klee_make_symbolic
	movl	-28(%rbp), %edi
	shrl	$31, %edi
	xorl	$1, %edi
	callq	klee_assume
	movl	-28(%rbp), %eax
	testl	%eax, %eax
	js	.LBB2_10
# BB#8:                                 #   in Loop: Header=BB2_3 Depth=1
	movq	(%rbx), %rbx
	cmpq	%r14, %rbx
	jne	.LBB2_3
.LBB2_9:
	xorl	%eax, %eax
.LBB2_10:                               # %.loopexit
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end2:
	.size	snd_device_register_all_PROSE, .Lfunc_end2-snd_device_register_all_PROSE

	.globl	snd_card_register_PROSE
	.align	16, 0x90
	.type	snd_card_register_PROSE,@function
snd_card_register_PROSE:                # @snd_card_register_PROSE
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movq	%rdi, %r14
	movl	$-22, %eax
	testq	%r14, %r14
	je	.LBB3_12
# BB#1:
	cmpb	$0, 2120(%r14)
	jne	.LBB3_3
# BB#2:
	movb	$1, 2120(%r14)
.LBB3_3:
	movq	416(%r14), %rbx
	addq	$416, %r14              # imm = 0x1A0
	cmpq	%r14, %rbx
	je	.LBB3_11
# BB#4:                                 # %.lr.ph.i
	leaq	-28(%rbp), %r15
	.align	16, 0x90
.LBB3_5:                                # =>This Inner Loop Header: Depth=1
	cmpl	$0, 24(%rbx)
	jne	.LBB3_9
# BB#6:                                 #   in Loop: Header=BB3_5 Depth=1
	movq	40(%rbx), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.LBB3_8
# BB#7:                                 #   in Loop: Header=BB3_5 Depth=1
	movq	%rbx, %rdi
	callq	*%rax
	testl	%eax, %eax
	js	.LBB3_12
.LBB3_8:                                #   in Loop: Header=BB3_5 Depth=1
	movl	$1, 24(%rbx)
.LBB3_9:                                # %__snd_device_register_PROSE.exit.i
                                        #   in Loop: Header=BB3_5 Depth=1
	movl	$4, %esi
	movq	$.L.str.1, %rdx
	movq	%r15, %rdi
	callq	klee_make_symbolic
	movl	-28(%rbp), %edi
	shrl	$31, %edi
	xorl	$1, %edi
	callq	klee_assume
	movl	-28(%rbp), %eax
	testl	%eax, %eax
	js	.LBB3_12
# BB#10:                                #   in Loop: Header=BB3_5 Depth=1
	movq	(%rbx), %rbx
	cmpq	%r14, %rbx
	jne	.LBB3_5
.LBB3_11:
	xorl	%eax, %eax
.LBB3_12:                               # %snd_device_register_all_PROSE.exit
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end3:
	.size	snd_card_register_PROSE, .Lfunc_end3-snd_card_register_PROSE

	.globl	__snd_device_disconnect_PROSE
	.align	16, 0x90
	.type	__snd_device_disconnect_PROSE,@function
__snd_device_disconnect_PROSE:          # @__snd_device_disconnect_PROSE
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	movq	%rdi, %rbx
	cmpl	$1, 24(%rbx)
	jne	.LBB4_5
# BB#1:
	movq	40(%rbx), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.LBB4_4
# BB#2:
	movq	%rbx, %rdi
	callq	*%rax
	testl	%eax, %eax
	je	.LBB4_4
# BB#3:
	movq	16(%rbx), %rax
	movq	1352(%rax), %rdi
	movq	$.L.str.2, %rsi
	xorl	%eax, %eax
	callq	dev_err
.LBB4_4:
	movl	$2, 24(%rbx)
.LBB4_5:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end4:
	.size	__snd_device_disconnect_PROSE, .Lfunc_end4-__snd_device_disconnect_PROSE

	.globl	snd_device_disconnect_all_PROSE
	.align	16, 0x90
	.type	snd_device_disconnect_all_PROSE,@function
snd_device_disconnect_all_PROSE:        # @snd_device_disconnect_all_PROSE
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rdi, %r14
	testq	%r14, %r14
	je	.LBB5_9
# BB#1:
	movq	424(%r14), %rbx
	addq	$416, %r14              # imm = 0x1A0
	jmp	.LBB5_2
	.align	16, 0x90
.LBB5_8:                                # %__snd_device_disconnect_PROSE.exit
                                        #   in Loop: Header=BB5_2 Depth=1
	movq	8(%rbx), %rbx
.LBB5_2:                                # =>This Inner Loop Header: Depth=1
	cmpq	%r14, %rbx
	je	.LBB5_9
# BB#3:                                 # %.lr.ph
                                        #   in Loop: Header=BB5_2 Depth=1
	cmpl	$1, 24(%rbx)
	jne	.LBB5_8
# BB#4:                                 #   in Loop: Header=BB5_2 Depth=1
	movq	40(%rbx), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.LBB5_7
# BB#5:                                 #   in Loop: Header=BB5_2 Depth=1
	movq	%rbx, %rdi
	callq	*%rax
	testl	%eax, %eax
	je	.LBB5_7
# BB#6:                                 #   in Loop: Header=BB5_2 Depth=1
	movq	16(%rbx), %rax
	movq	1352(%rax), %rdi
	movq	$.L.str.2, %rsi
	xorl	%eax, %eax
	callq	dev_err
.LBB5_7:                                #   in Loop: Header=BB5_2 Depth=1
	movl	$2, 24(%rbx)
	jmp	.LBB5_8
.LBB5_9:                                # %.loopexit
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end5:
	.size	snd_device_disconnect_all_PROSE, .Lfunc_end5-snd_device_disconnect_all_PROSE

	.globl	snd_card_disconnect_PROSE
	.align	16, 0x90
	.type	snd_card_disconnect_PROSE,@function
snd_card_disconnect_PROSE:              # @snd_card_disconnect_PROSE
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movq	%rdi, %r14
	movl	$-22, %eax
	testq	%r14, %r14
	je	.LBB6_13
# BB#1:
	leaq	-28(%rbp), %rdi
	movl	$4, %esi
	movq	$.L.str.3, %rdx
	callq	klee_make_symbolic
	cmpl	$0, -28(%rbp)
	js	.LBB6_12
# BB#2:
	leaq	416(%r14), %r15
	movq	424(%r14), %rbx
	jmp	.LBB6_3
	.align	16, 0x90
.LBB6_9:                                # %__snd_device_disconnect_PROSE.exit.i
                                        #   in Loop: Header=BB6_3 Depth=1
	movq	8(%rbx), %rbx
.LBB6_3:                                # =>This Inner Loop Header: Depth=1
	cmpq	%r15, %rbx
	je	.LBB6_10
# BB#4:                                 # %.lr.ph.i
                                        #   in Loop: Header=BB6_3 Depth=1
	cmpl	$1, 24(%rbx)
	jne	.LBB6_9
# BB#5:                                 #   in Loop: Header=BB6_3 Depth=1
	movq	40(%rbx), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.LBB6_8
# BB#6:                                 #   in Loop: Header=BB6_3 Depth=1
	movq	%rbx, %rdi
	callq	*%rax
	testl	%eax, %eax
	je	.LBB6_8
# BB#7:                                 #   in Loop: Header=BB6_3 Depth=1
	movq	16(%rbx), %rax
	movq	1352(%rax), %rdi
	movq	$.L.str.2, %rsi
	xorl	%eax, %eax
	callq	dev_err
.LBB6_8:                                #   in Loop: Header=BB6_3 Depth=1
	movl	$2, 24(%rbx)
	jmp	.LBB6_9
.LBB6_10:                               # %snd_device_disconnect_all_PROSE.exit
	cmpb	$0, 2120(%r14)
	je	.LBB6_12
# BB#11:
	movb	$0, 2120(%r14)
.LBB6_12:
	movl	-28(%rbp), %eax
.LBB6_13:
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end6:
	.size	snd_card_disconnect_PROSE, .Lfunc_end6-snd_card_disconnect_PROSE

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI7_0:
	.quad	-2401263026318606080    # 0xdead000000000100
	.quad	-2401263026318605824    # 0xdead000000000200
	.text
	.globl	snd_device_free_all_PROSE
	.align	16, 0x90
	.type	snd_device_free_all_PROSE,@function
snd_device_free_all_PROSE:              # @snd_device_free_all_PROSE
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movq	%rdi, %r14
	testq	%r14, %r14
	je	.LBB7_12
# BB#1:
	movq	424(%r14), %r15
	addq	$416, %r14              # imm = 0x1A0
	jmp	.LBB7_2
	.align	16, 0x90
.LBB7_11:                               #   in Loop: Header=BB7_2 Depth=1
	movq	%rbx, %rdi
	callq	kfree
.LBB7_2:                                # =>This Inner Loop Header: Depth=1
	cmpq	%r14, %r15
	je	.LBB7_12
# BB#3:                                 # %.lr.ph
                                        #   in Loop: Header=BB7_2 Depth=1
	movq	%r15, %rbx
	movq	(%rbx), %rax
	movq	8(%rbx), %r15
	movq	%r15, 8(%rax)
	movq	%rax, (%r15)
	movaps	.LCPI7_0, %xmm0         # xmm0 = [16045481047390945536,16045481047390945792]
	movups	%xmm0, (%rbx)
	cmpl	$1, 24(%rbx)
	jne	.LBB7_8
# BB#4:                                 #   in Loop: Header=BB7_2 Depth=1
	movq	40(%rbx), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.LBB7_7
# BB#5:                                 #   in Loop: Header=BB7_2 Depth=1
	movq	%rbx, %rdi
	callq	*%rax
	testl	%eax, %eax
	je	.LBB7_7
# BB#6:                                 #   in Loop: Header=BB7_2 Depth=1
	movq	16(%rbx), %rax
	movq	1352(%rax), %rdi
	movq	$.L.str.2, %rsi
	xorl	%eax, %eax
	callq	dev_err
.LBB7_7:                                #   in Loop: Header=BB7_2 Depth=1
	movl	$2, 24(%rbx)
.LBB7_8:                                # %__snd_device_disconnect_PROSE.exit
                                        #   in Loop: Header=BB7_2 Depth=1
	movq	40(%rbx), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.LBB7_11
# BB#9:                                 #   in Loop: Header=BB7_2 Depth=1
	movq	%rbx, %rdi
	callq	*%rax
	testl	%eax, %eax
	je	.LBB7_11
# BB#10:                                #   in Loop: Header=BB7_2 Depth=1
	movq	16(%rbx), %rax
	movq	1352(%rax), %rdi
	movq	$.L.str.4, %rsi
	xorl	%eax, %eax
	callq	dev_err
	jmp	.LBB7_11
.LBB7_12:                               # %.loopexit
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end7:
	.size	snd_device_free_all_PROSE, .Lfunc_end7-snd_device_free_all_PROSE

	.globl	snd_card_free_when_closed_PROSE
	.align	16, 0x90
	.type	snd_card_free_when_closed_PROSE,@function
snd_card_free_when_closed_PROSE:        # @snd_card_free_when_closed_PROSE
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rdi, %r15
	callq	snd_card_disconnect_PROSE
	movl	%eax, %r14d
	testl	%r14d, %r14d
	js	.LBB8_5
# BB#1:
	leaq	1360(%r15), %r12
	movq	%r12, %rdi
	callq	klee_get_metadata
	movl	%eax, %ebx
	leal	-1(%rbx), %esi
	movq	%r12, %rdi
	callq	klee_set_metadata
	decl	%ebx
	jne	.LBB8_5
# BB#2:
	movq	%r15, %rdi
	callq	snd_device_free_all_PROSE
	movq	408(%r15), %rax
	testq	%rax, %rax
	je	.LBB8_4
# BB#3:
	movq	%r15, %rdi
	callq	*%rax
.LBB8_4:
	movq	%r15, %rdi
	callq	kfree
.LBB8_5:
	movl	%r14d, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end8:
	.size	snd_card_free_when_closed_PROSE, .Lfunc_end8-snd_card_free_when_closed_PROSE

	.globl	snd_card_free_PROSE
	.align	16, 0x90
	.type	snd_card_free_PROSE,@function
snd_card_free_PROSE:                    # @snd_card_free_PROSE
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rdi, %r15
	callq	snd_card_disconnect_PROSE
	movl	%eax, %r14d
	testl	%r14d, %r14d
	js	.LBB9_5
# BB#1:
	leaq	1360(%r15), %r12
	movq	%r12, %rdi
	callq	klee_get_metadata
	movl	%eax, %ebx
	leal	-1(%rbx), %esi
	movq	%r12, %rdi
	callq	klee_set_metadata
	decl	%ebx
	jne	.LBB9_5
# BB#2:
	movq	%r15, %rdi
	callq	snd_device_free_all_PROSE
	movq	408(%r15), %rax
	testq	%rax, %rax
	je	.LBB9_4
# BB#3:
	movq	%r15, %rdi
	callq	*%rax
.LBB9_4:
	movq	%r15, %rdi
	callq	kfree
.LBB9_5:                                # %snd_card_free_when_closed_PROSE.exit
	movl	%r14d, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end9:
	.size	snd_card_free_PROSE, .Lfunc_end9-snd_card_free_PROSE

	.globl	snd_device_new_PROSE
	.align	16, 0x90
	.type	snd_device_new_PROSE,@function
snd_device_new_PROSE:                   # @snd_device_new_PROSE
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rcx, %r12
	movq	%rdx, %r13
	movl	%esi, %r14d
	movq	%rdi, %rbx
	movl	$-6, %eax
	testq	%rbx, %rbx
	je	.LBB10_10
# BB#1:
	testq	%r13, %r13
	je	.LBB10_10
# BB#2:
	testq	%r12, %r12
	je	.LBB10_10
# BB#3:
	movl	$48, %edi
	movl	$21004480, %esi         # imm = 0x14080C0
	callq	__kmalloc
	movq	%rax, %r15
	movl	$-12, %eax
	testq	%r15, %r15
	je	.LBB10_10
# BB#4:
	leaq	-44(%rbp), %rdi
	movl	$4, %esi
	movq	$.L.str.5, %rdx
	callq	klee_make_symbolic
	movl	-44(%rbp), %eax
	testl	%eax, %eax
	js	.LBB10_10
# BB#5:
	movq	%r15, (%r15)
	movq	%r15, 8(%r15)
	movq	%rbx, 16(%r15)
	movl	%r14d, 28(%r15)
	movl	$0, 24(%r15)
	movq	%r13, 32(%r15)
	movq	%r12, 40(%r15)
	movq	424(%rbx), %rax
	addq	$416, %rbx              # imm = 0x1A0
	jmp	.LBB10_6
	.align	16, 0x90
.LBB10_11:                              #   in Loop: Header=BB10_6 Depth=1
	movq	8(%rax), %rax
.LBB10_6:                               # =>This Inner Loop Header: Depth=1
	cmpq	%rbx, %rax
	je	.LBB10_9
# BB#7:                                 # %.lr.ph
                                        #   in Loop: Header=BB10_6 Depth=1
	cmpl	%r14d, 28(%rax)
	ja	.LBB10_11
# BB#8:
	movq	%rax, %rbx
.LBB10_9:                               # %._crit_edge
	movq	(%rbx), %rax
	movq	%r15, 8(%rax)
	movq	%rax, (%r15)
	movq	%rbx, 8(%r15)
	movq	%r15, (%rbx)
	movl	-44(%rbp), %eax
.LBB10_10:
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end10:
	.size	snd_device_new_PROSE, .Lfunc_end10-snd_device_new_PROSE

	.globl	snd_rawmidi_new_PROSE
	.align	16, 0x90
	.type	snd_rawmidi_new_PROSE,@function
snd_rawmidi_new_PROSE:                  # @snd_rawmidi_new_PROSE
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$16, %rsp
	movq	%r9, %r15
	movl	%edx, %r14d
	movq	%rdi, %r12
	movl	$-6, %eax
	testq	%r12, %r12
	je	.LBB11_8
# BB#1:
	testq	%r15, %r15
	je	.LBB11_3
# BB#2:
	movq	$0, (%r15)
.LBB11_3:
	movl	$1056, %edi             # imm = 0x420
	movl	$21004480, %esi         # imm = 0x14080C0
	callq	__kmalloc
	movq	%rax, %rbx
	movl	$-12, %eax
	testq	%rbx, %rbx
	je	.LBB11_8
# BB#4:
	leaq	-36(%rbp), %rdi
	movl	$4, %esi
	movq	$.L.str.6, %rdx
	callq	klee_make_symbolic
	cmpl	$0, -36(%rbp)
	js	.LBB11_7
# BB#5:
	movq	%r12, (%rbx)
	movl	%r14d, 24(%rbx)
	movq	%rbx, %rdi
	addq	$312, %rdi              # imm = 0x138
	movl	$1, %esi
	callq	klee_set_metadata
	testq	%r15, %r15
	je	.LBB11_7
# BB#6:
	movq	%rbx, (%r15)
.LBB11_7:
	movl	-36(%rbp), %eax
.LBB11_8:
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end11:
	.size	snd_rawmidi_new_PROSE, .Lfunc_end11-snd_rawmidi_new_PROSE

	.globl	snd_rawmidi_free_PROSE
	.align	16, 0x90
	.type	snd_rawmidi_free_PROSE,@function
snd_rawmidi_free_PROSE:                 # @snd_rawmidi_free_PROSE
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movq	%rdi, %r15
	leaq	-28(%rbp), %rdi
	movl	$4, %esi
	movq	$.L.str.7, %rdx
	callq	klee_make_symbolic
	movl	-28(%rbp), %eax
	testl	%eax, %eax
	js	.LBB12_6
# BB#1:
	testq	%r15, %r15
	je	.LBB12_7
# BB#2:
	movq	248(%r15), %rax
	testq	%rax, %rax
	je	.LBB12_4
# BB#3:
	movq	%r15, %rdi
	callq	*%rax
.LBB12_4:
	leaq	312(%r15), %r14
	movq	%r14, %rdi
	callq	klee_get_metadata
	movl	%eax, %ebx
	leal	-1(%rbx), %esi
	movq	%r14, %rdi
	callq	klee_set_metadata
	decl	%ebx
	jne	.LBB12_6
# BB#5:
	movq	%r15, %rdi
	callq	kfree
.LBB12_6:
	xorl	%eax, %eax
.LBB12_7:
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end12:
	.size	snd_rawmidi_free_PROSE, .Lfunc_end12-snd_rawmidi_free_PROSE

	.globl	snd_pcm_new_PROSE
	.align	16, 0x90
	.type	snd_pcm_new_PROSE,@function
snd_pcm_new_PROSE:                      # @snd_pcm_new_PROSE
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$16, %rsp
	movq	%r9, %r15
	movl	%edx, %r14d
	movq	%rdi, %r12
	movl	$-6, %eax
	testq	%r12, %r12
	je	.LBB13_7
# BB#1:
	testq	%r15, %r15
	je	.LBB13_3
# BB#2:
	movq	$0, (%r15)
.LBB13_3:
	movl	$1968, %edi             # imm = 0x7B0
	movl	$21004480, %esi         # imm = 0x14080C0
	callq	__kmalloc
	movq	%rax, %rbx
	movl	$-12, %eax
	testq	%rbx, %rbx
	je	.LBB13_7
# BB#4:
	leaq	-36(%rbp), %rdi
	movl	$4, %esi
	movq	$.L.str.8, %rdx
	callq	klee_make_symbolic
	movl	-36(%rbp), %eax
	testl	%eax, %eax
	js	.LBB13_7
# BB#5:
	movq	%r12, (%rbx)
	movl	%r14d, 24(%rbx)
	testq	%r15, %r15
	je	.LBB13_7
# BB#6:
	movq	%rbx, (%r15)
.LBB13_7:
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end13:
	.size	snd_pcm_new_PROSE, .Lfunc_end13-snd_pcm_new_PROSE

	.globl	dev_free_PROSE
	.align	16, 0x90
	.type	dev_free_PROSE,@function
dev_free_PROSE:                         # @dev_free_PROSE
# BB#0:
	retq
.Lfunc_end14:
	.size	dev_free_PROSE, .Lfunc_end14-dev_free_PROSE

	.globl	dev_register_PROSE
	.align	16, 0x90
	.type	dev_register_PROSE,@function
dev_register_PROSE:                     # @dev_register_PROSE
# BB#0:
	retq
.Lfunc_end15:
	.size	dev_register_PROSE, .Lfunc_end15-dev_register_PROSE

	.globl	dev_disconnect_PROSE
	.align	16, 0x90
	.type	dev_disconnect_PROSE,@function
dev_disconnect_PROSE:                   # @dev_disconnect_PROSE
# BB#0:
	retq
.Lfunc_end16:
	.size	dev_disconnect_PROSE, .Lfunc_end16-dev_disconnect_PROSE

	.globl	snd_hwdep_new
	.align	16, 0x90
	.type	snd_hwdep_new,@function
snd_hwdep_new:                          # @snd_hwdep_new
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	movq	%rcx, %rbx
	movl	%edx, %r12d
	movq	%rdi, %r15
	movl	$-6, %r14d
	testq	%r15, %r15
	je	.LBB17_14
# BB#1:
	testq	%rbx, %rbx
	je	.LBB17_3
# BB#2:
	movq	$0, (%rbx)
.LBB17_3:
	movl	$1056, %edi             # imm = 0x420
	movl	$21004480, %esi         # imm = 0x14080C0
	callq	__kmalloc
	movl	$-12, %r14d
	testq	%rax, %rax
	je	.LBB17_14
# BB#4:
	movq	%rbx, -56(%rbp)         # 8-byte Spill
	movq	%r15, (%rax)
	movl	%r12d, 24(%rax)
	movq	%rax, %r12
	movq	%rax, %rbx
	addq	$280, %r12              # imm = 0x118
	movl	$1, %esi
	movq	%r12, %rdi
	callq	klee_set_metadata
	movl	$48, %edi
	movl	$21004480, %esi         # imm = 0x14080C0
	callq	__kmalloc
	movq	%rax, %r13
	movl	$-12, %r14d
	testq	%r13, %r13
	je	.LBB17_11
# BB#5:
	leaq	-44(%rbp), %rdi
	movl	$4, %esi
	movq	$.L.str.5, %rdx
	callq	klee_make_symbolic
	movl	-44(%rbp), %r14d
	testl	%r14d, %r14d
	js	.LBB17_11
# BB#6:
	movq	%r13, (%r13)
	movq	%r13, 8(%r13)
	movq	%r15, 16(%r13)
	movl	$10, 28(%r13)
	movl	$0, 24(%r13)
	movq	%rbx, %rcx
	movq	%rcx, 32(%r13)
	movq	$snd_hwdep_new.ops, 40(%r13)
	movq	424(%r15), %rax
	addq	$416, %r15              # imm = 0x1A0
	jmp	.LBB17_7
	.align	16, 0x90
.LBB17_15:                              #   in Loop: Header=BB17_7 Depth=1
	movq	8(%rax), %rax
.LBB17_7:                               # =>This Inner Loop Header: Depth=1
	cmpq	%r15, %rax
	je	.LBB17_10
# BB#8:                                 # %.lr.ph.i
                                        #   in Loop: Header=BB17_7 Depth=1
	cmpl	$11, 28(%rax)
	jae	.LBB17_15
# BB#9:
	movq	%rax, %r15
.LBB17_10:                              # %snd_device_new_PROSE.exit
	movq	(%r15), %rax
	movq	%r13, 8(%rax)
	movq	%rax, (%r13)
	movq	%r15, 8(%r13)
	movq	%r13, (%r15)
	movl	-44(%rbp), %r14d
	testl	%r14d, %r14d
	js	.LBB17_11
# BB#12:
	movq	-56(%rbp), %rbx         # 8-byte Reload
	testq	%rbx, %rbx
	je	.LBB17_14
# BB#13:
	movq	%rcx, (%rbx)
	jmp	.LBB17_14
.LBB17_11:
	xorl	%esi, %esi
	movq	%r12, %rdi
	callq	klee_set_metadata
.LBB17_14:
	movl	%r14d, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end17:
	.size	snd_hwdep_new, .Lfunc_end17-snd_hwdep_new

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"snd_card_new_return_value"
	.size	.L.str, 26

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"__snd_device_register_return_value"
	.size	.L.str.1, 35

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"device disconnect failure\n"
	.size	.L.str.2, 27

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"snd_card_disconnect_return_value"
	.size	.L.str.3, 33

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"device free failure\n"
	.size	.L.str.4, 21

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"snd_device_new_return_value"
	.size	.L.str.5, 28

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"snd_rawmidi_new_return_value"
	.size	.L.str.6, 29

	.type	.L.str.7,@object        # @.str.7
.L.str.7:
	.asciz	"snd_rawmidi_free_return_value"
	.size	.L.str.7, 30

	.type	.L.str.8,@object        # @.str.8
.L.str.8:
	.asciz	"snd_pcm_new_return_value"
	.size	.L.str.8, 25

	.type	snd_hwdep_new.ops,@object # @snd_hwdep_new.ops
	.data
	.align	8
snd_hwdep_new.ops:
	.quad	dev_free_PROSE
	.quad	dev_register_PROSE
	.quad	dev_disconnect_PROSE
	.size	snd_hwdep_new.ops, 24


	.ident	"clang version 3.8.0-2ubuntu3~trusty5 (tags/RELEASE_380/final)"
	.section	".note.GNU-stack","",@progbits
