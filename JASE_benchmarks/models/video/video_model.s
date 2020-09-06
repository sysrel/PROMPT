	.text
	.file	"/home/tuba/Documents/experiments/driverVerification/PMGuided/models/video/video_model.bc"
	.globl	__video_register_device_PROSE
	.align	16, 0x90
	.type	__video_register_device_PROSE,@function
__video_register_device_PROSE:          # @__video_register_device_PROSE
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	movq	%rdi, %rbx
	leaq	-12(%rbp), %rdi
	movl	$4, %esi
	movq	$.L.str, %rdx
	callq	klee_make_symbolic
	movl	-12(%rbp), %eax
	testl	%eax, %eax
	js	.LBB0_2
# BB#1:
	leaq	440(%rbx), %rdi
	movl	$1, %esi
	callq	klee_set_metadata
	movq	1176(%rbx), %rbx
	movq	%rbx, %rdi
	callq	klee_get_metadata
	leal	1(%rax), %esi
	movq	%rbx, %rdi
	callq	klee_set_metadata
	movl	-12(%rbp), %eax
.LBB0_2:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end0:
	.size	__video_register_device_PROSE, .Lfunc_end0-__video_register_device_PROSE

	.globl	v4l2_device_get_PROSE
	.align	16, 0x90
	.type	v4l2_device_get_PROSE,@function
v4l2_device_get_PROSE:                  # @v4l2_device_get_PROSE
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	movq	%rdi, %rbx
	callq	klee_get_metadata
	leal	1(%rax), %esi
	movq	%rbx, %rdi
	callq	klee_set_metadata
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end1:
	.size	v4l2_device_get_PROSE, .Lfunc_end1-v4l2_device_get_PROSE

	.globl	video_unregister_device_PROSE
	.align	16, 0x90
	.type	video_unregister_device_PROSE,@function
video_unregister_device_PROSE:          # @video_unregister_device_PROSE
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rdi, %r15
	testq	%r15, %r15
	je	.LBB2_8
# BB#1:
	movq	1176(%r15), %r12
	leaq	440(%r15), %r14
	movq	%r14, %rdi
	callq	klee_get_metadata
	movl	%eax, %ebx
	leal	-1(%rbx), %esi
	movq	%r14, %rdi
	callq	klee_set_metadata
	decl	%ebx
	jne	.LBB2_8
# BB#2:
	xorl	%r14d, %r14d
	cmpq	$0, 112(%r12)
	je	.LBB2_4
# BB#3:                                 # %select.false
	movq	%r12, %r14
.LBB2_4:                                # %select.end
	movq	1312(%r15), %rax
	testq	%rax, %rax
	je	.LBB2_6
# BB#5:
	movq	%r15, %rdi
	callq	*%rax
.LBB2_6:
	testq	%r14, %r14
	je	.LBB2_8
# BB#7:
	movq	%r14, %rdi
	callq	v4l2_device_put
.LBB2_8:
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end2:
	.size	video_unregister_device_PROSE, .Lfunc_end2-video_unregister_device_PROSE

	.globl	v4l2_device_register_PROSE
	.align	16, 0x90
	.type	v4l2_device_register_PROSE,@function
v4l2_device_register_PROSE:             # @v4l2_device_register_PROSE
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	subq	$16, %rsp
	movq	%rsi, %r14
	movq	%rdi, %rbx
	leaq	-20(%rbp), %rdi
	movl	$4, %esi
	movq	$.L.str.1, %rdx
	callq	klee_make_symbolic
	cmpl	$0, -20(%rbp)
	js	.LBB3_3
# BB#1:
	movq	%rbx, %rdi
	callq	klee_get_metadata
	leal	1(%rax), %esi
	movq	%rbx, %rdi
	callq	klee_set_metadata
	movl	$1, %esi
	movq	%r14, %rdi
	callq	klee_set_metadata
	movq	%rbx, (%r14)
	cmpq	$0, 152(%rbx)
	jne	.LBB3_3
# BB#2:
	movq	%r14, 152(%rbx)
.LBB3_3:
	movl	-20(%rbp), %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end3:
	.size	v4l2_device_register_PROSE, .Lfunc_end3-v4l2_device_register_PROSE

	.globl	v4l2_device_unregister_PROSE
	.align	16, 0x90
	.type	v4l2_device_unregister_PROSE,@function
v4l2_device_unregister_PROSE:           # @v4l2_device_unregister_PROSE
# BB#0:
	testq	%rdi, %rdi
	je	.LBB4_2
# BB#1:
	pushq	%rbp
	movq	%rsp, %rbp
	callq	v4l2_device_disconnect
	popq	%rbp
.LBB4_2:
	retq
.Lfunc_end4:
	.size	v4l2_device_unregister_PROSE, .Lfunc_end4-v4l2_device_unregister_PROSE

	.globl	v4l2_device_disconnect_PROSE
	.align	16, 0x90
	.type	v4l2_device_disconnect_PROSE,@function
v4l2_device_disconnect_PROSE:           # @v4l2_device_disconnect_PROSE
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	movq	%rdi, %rbx
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	.LBB5_4
# BB#1:
	cmpq	%rbx, 152(%rdi)
	jne	.LBB5_3
# BB#2:
	movq	$0, 152(%rdi)
	movq	(%rbx), %rdi
.LBB5_3:
	callq	klee_get_metadata
	movq	(%rbx), %rdi
	leal	-1(%rax), %esi
	callq	klee_set_metadata
	movq	$0, (%rbx)
.LBB5_4:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end5:
	.size	v4l2_device_disconnect_PROSE, .Lfunc_end5-v4l2_device_disconnect_PROSE

	.globl	v4l2_device_put_PROSE
	.align	16, 0x90
	.type	v4l2_device_put_PROSE,@function
v4l2_device_put_PROSE:                  # @v4l2_device_put_PROSE
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	subq	$16, %rsp
	movq	%rdi, %r14
	leaq	-20(%rbp), %rdi
	movl	$4, %esi
	movq	$.L.str.2, %rdx
	callq	klee_make_symbolic
	cmpl	$0, -20(%rbp)
	js	.LBB6_4
# BB#1:
	movq	%r14, %rdi
	callq	klee_get_metadata
	movl	%eax, %ebx
	leal	-1(%rbx), %esi
	movq	%r14, %rdi
	callq	klee_set_metadata
	decl	%ebx
	jne	.LBB6_4
# BB#2:
	movq	112(%r14), %rax
	testq	%rax, %rax
	je	.LBB6_4
# BB#3:
	movq	%r14, %rdi
	callq	*%rax
.LBB6_4:
	movl	-20(%rbp), %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end6:
	.size	v4l2_device_put_PROSE, .Lfunc_end6-v4l2_device_put_PROSE

	.globl	atomic_add_return_PROSE
	.align	16, 0x90
	.type	atomic_add_return_PROSE,@function
atomic_add_return_PROSE:                # @atomic_add_return_PROSE
# BB#0:
	addl	(%rsi), %edi
	movl	%edi, %eax
	retq
.Lfunc_end7:
	.size	atomic_add_return_PROSE, .Lfunc_end7-atomic_add_return_PROSE

	.globl	atomic_dec_PROSE
	.align	16, 0x90
	.type	atomic_dec_PROSE,@function
atomic_dec_PROSE:                       # @atomic_dec_PROSE
# BB#0:
	decl	(%rdi)
	retq
.Lfunc_end8:
	.size	atomic_dec_PROSE, .Lfunc_end8-atomic_dec_PROSE

	.globl	atomic_inc_PROSE
	.align	16, 0x90
	.type	atomic_inc_PROSE,@function
atomic_inc_PROSE:                       # @atomic_inc_PROSE
# BB#0:
	decl	(%rdi)
	retq
.Lfunc_end9:
	.size	atomic_inc_PROSE, .Lfunc_end9-atomic_inc_PROSE

	.globl	v4l2_i2c_subdev_init_PROSE
	.align	16, 0x90
	.type	v4l2_i2c_subdev_init_PROSE,@function
v4l2_i2c_subdev_init_PROSE:             # @v4l2_i2c_subdev_init_PROSE
# BB#0:
	orb	$1, 156(%rdi)
	leaq	32(%rsi), %rax
	movq	168(%rsi), %rcx
	movq	16(%rcx), %rcx
	movq	%rcx, 144(%rdi)
	movq	%rax, 256(%rdi)
	movq	%rsi, 232(%rdi)
	movq	%rdi, 184(%rsi)
	retq
.Lfunc_end10:
	.size	v4l2_i2c_subdev_init_PROSE, .Lfunc_end10-v4l2_i2c_subdev_init_PROSE

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"__video_register_device_return_value"
	.size	.L.str, 37

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"v4l2_device_register_return_value"
	.size	.L.str.1, 34

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"v4l2_device_put_return_value"
	.size	.L.str.2, 29


	.ident	"clang version 3.8.0-2ubuntu3~trusty5 (tags/RELEASE_380/final)"
	.section	".note.GNU-stack","",@progbits
