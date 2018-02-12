	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"ark.c"
	.comm	st,16,4
	.comm	key,16,4
	.comm	pt,16,4
	.comm	mask,16,4
	.text
	.align	2
	.global	ARK
	.syntax unified
	.arm
	.fpu softvfp
	.type	ARK, %function
ARK:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, #0
	strb	r3, [fp, #-5]
	b	.L2
.L3:
	ldrb	r3, [fp, #-5]  @ r3 = i
	ldr	r2, .L4          @ r2 = pt
	ldrb	r1, [r2, r3]   @ r1 = pt[i]
	ldrb	r3, [fp, #-5]  @ r3 = i
	ldr	r2, .L4+4        @ r2 = key
	ldrb	r2, [r2, r3]   @ r2 = key[i]
	ldrb	r3, [fp, #-5]  @ r3 = i
	ldr	r0, .L4+8        @ r0 = mask
	ldrb	r3, [r0, r3]   @ r3 = mask[i]
	eor	r3, r3, r2       @ r3 = mask[i] + key[i]
	and	r2, r3, #255     @ r2 = mask[i] + key[i]
	ldrb	r3, [fp, #-5]  @ r3 = i
	eor	r2, r2, r1       @ r2 = mask[i] + key[i] + pt[i]
	and	r1, r2, #255     @ r1 = mask[i] + key[i] + pt[i]
	ldr	r2, .L4+12       @ r2 = st
	strb	r1, [r2, r3]   @ st[i] = mask[i] + ...
	ldrb	r3, [fp, #-5]  @ r3 = i
	add	r3, r3, #1       @ r3 = i + 1
	strb	r3, [fp, #-5]  @ ..
.L2:
	ldrb	r3, [fp, #-5]
	cmp	r3, #1
	bls	.L3
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	pt
	.word	key
	.word	mask
	.word	st
	.size	ARK, .-ARK
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2017-q4-major) 7.2.1 20170904 (release) [ARM/embedded-7-branch revision 255204]"
