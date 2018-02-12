	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"ark.c"
	.text
	.align	2
	.global	ARK
	.syntax unified
	.arm
	.fpu softvfp
	.type	ARK, %function
ARK:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L4
	ldr	r3, .L4+4
	ldr	r1, .L4+8
	ldrb	r4, [r0]	@ zero_extendqisi2
	ldrb	lr, [r0, #1]	@ zero_extendqisi2
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	ldrb	ip, [r1]	@ zero_extendqisi2
	ldrb	r0, [r1, #1]	@ zero_extendqisi2
	eor	r2, r2, r4
	eor	r3, r3, lr
	ldr	r1, .L4+12
	eor	r2, r2, ip
	eor	r3, r3, r0
	strb	r2, [r1]
	strb	r3, [r1, #1]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	key
	.word	pt
	.word	mask
	.word	st
	.size	ARK, .-ARK
	.comm	mask,16,4
	.comm	pt,16,4
	.comm	key,16,4
	.comm	st,16,4
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2017-q4-major) 7.2.1 20170904 (release) [ARM/embedded-7-branch revision 255204]"
