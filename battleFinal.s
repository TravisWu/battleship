	.arch armv6
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu vfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"battleFinal.c"
	.text
	.align	2
	.global	buildBoard
	.type	buildBoard, %function
buildBoard:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L5:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L3
.L4:
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [fp, #-12]
	mvn	r1, #0
	str	r1, [r3, r2, asl #2]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L3:
	ldr	r3, [fp, #-12]
	cmp	r3, #4
	ble	.L4
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #4
	ble	.L5
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	buildBoard, .-buildBoard
	.section	.rodata
	.align	2
.LC0:
	.ascii	" X |\000"
	.align	2
.LC1:
	.ascii	" Y |\000"
	.align	2
.LC2:
	.ascii	" O |\000"
	.align	2
.LC3:
	.ascii	" x |\000"
	.align	2
.LC4:
	.ascii	" M |\000"
	.align	2
.LC5:
	.ascii	" H |\000"
	.align	2
.LC6:
	.ascii	" 0 |\000"
	.align	2
.LC7:
	.ascii	" 1 |\000"
	.align	2
.LC8:
	.ascii	"   1   2   3   4   5 \000"
	.align	2
.LC9:
	.ascii	" *-------------------*\000"
	.align	2
.LC10:
	.ascii	"%d|\000"
	.align	2
.LC11:
	.ascii	"   |\000"
	.align	2
.LC12:
	.ascii	"%s\000"
	.align	2
.LC13:
	.ascii	"\012 *-------------------*\000"
	.align	2
.LC14:
	.ascii	"\012 |---|---|---|---|---|\000"
	.text
	.align	2
	.global	displayBoard
	.type	displayBoard, %function
displayBoard:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, .L20
	str	r3, [fp, #-16]
	ldr	r3, .L20+4
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	cmp	r3, #1
	bne	.L7
	ldr	r3, .L20+8
	str	r3, [fp, #-16]
	ldr	r3, .L20+12
	str	r3, [fp, #-20]
	b	.L8
.L7:
	ldr	r3, [fp, #-28]
	cmp	r3, #2
	bne	.L9
	ldr	r3, .L20+16
	str	r3, [fp, #-16]
	ldr	r3, .L20+20
	str	r3, [fp, #-20]
	b	.L8
.L9:
	ldr	r3, [fp, #-28]
	cmp	r3, #3
	bne	.L8
	ldr	r3, .L20+24
	str	r3, [fp, #-16]
	ldr	r3, .L20+28
	str	r3, [fp, #-20]
.L8:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L10
.L19:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L11
	ldr	r0, .L20+32
	bl	puts
	ldr	r0, .L20+36
	bl	puts
.L11:
	ldr	r2, .L20+40
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	mov	r0, r2
	mov	r1, r3
	bl	printf
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L12
.L16:
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [fp, #-12]
	ldr	r3, [r3, r2, asl #2]
	cmn	r3, #1
	bne	.L13
	ldr	r3, .L20+44
	mov	r0, r3
	bl	printf
	b	.L14
.L13:
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [fp, #-12]
	ldr	r3, [r3, r2, asl #2]
	cmp	r3, #0
	bne	.L15
	ldr	r3, .L20+48
	mov	r0, r3
	ldr	r1, [fp, #-16]
	bl	printf
	b	.L14
.L15:
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [fp, #-12]
	ldr	r3, [r3, r2, asl #2]
	cmp	r3, #1
	bne	.L14
	ldr	r3, .L20+48
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	printf
.L14:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L12:
	ldr	r3, [fp, #-12]
	cmp	r3, #4
	ble	.L16
	ldr	r3, [fp, #-8]
	cmp	r3, #4
	bne	.L17
	ldr	r0, .L20+52
	bl	puts
	b	.L18
.L17:
	ldr	r0, .L20+56
	bl	puts
.L18:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L10:
	ldr	r3, [fp, #-8]
	cmp	r3, #4
	ble	.L19
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L21:
	.align	2
.L20:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.size	displayBoard, .-displayBoard
	.align	2
	.global	makeShips
	.type	makeShips, %function
makeShips:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #20
	str	r0, [fp, #-24]
	mov	r0, #0
	bl	time
	mov	r3, r0
	mov	r0, r3
	bl	srand
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L23
.L28:
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-24]
	add	r4, r2, r3
	bl	rand
	mov	r1, r0
	ldr	r3, .L29
	smull	r2, r3, r3, r1
	mov	r2, r3, asr #1
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	rsb	r2, r3, r1
	str	r2, [r4, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-24]
	add	r4, r2, r3
	bl	rand
	mov	r1, r0
	ldr	r3, .L29
	smull	r2, r3, r3, r1
	mov	r2, r3, asr #1
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	rsb	r2, r3, r1
	str	r2, [r4, #4]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L24
.L27:
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #3
	ldr	r1, [fp, #-24]
	add	r3, r1, r3
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	.L25
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #3
	ldr	r1, [fp, #-24]
	add	r3, r1, r3
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L25
.L26:
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-24]
	add	r4, r2, r3
	bl	rand
	mov	r1, r0
	ldr	r3, .L29
	smull	r2, r3, r3, r1
	mov	r2, r3, asr #1
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	rsb	r2, r3, r1
	str	r2, [r4, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-24]
	add	r4, r2, r3
	bl	rand
	mov	r1, r0
	ldr	r3, .L29
	smull	r2, r3, r3, r1
	mov	r2, r3, asr #1
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	rsb	r2, r3, r1
	str	r2, [r4, #4]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #3
	ldr	r1, [fp, #-24]
	add	r3, r1, r3
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	.L25
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #3
	ldr	r1, [fp, #-24]
	add	r3, r1, r3
	ldr	r3, [r3, #4]
	cmp	r2, r3
	beq	.L26
.L25:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L24:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	blt	.L27
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L23:
	ldr	r3, [fp, #-16]
	cmp	r3, #2
	ble	.L28
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
.L30:
	.align	2
.L29:
	.word	1717986919
	.size	makeShips, .-makeShips
	.section	.rodata
	.align	2
.LC15:
	.ascii	"Enter 0 at any time to restart or exit.\000"
	.text
	.align	2
	.global	shoot
	.type	shoot, %function
shoot:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	ldr	r0, .L32
	bl	puts
	bl	theRow
	mov	r2, r0
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	sub	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	add	r4, r3, #4
	bl	column
	mov	r3, r0
	str	r3, [r4, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #4
	ldr	r2, [r3, #0]
	sub	r2, r2, #1
	str	r2, [r3, #0]
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
.L33:
	.align	2
.L32:
	.word	.LC15
	.size	shoot, .-shoot
	.section	.rodata
	.align	2
.LC16:
	.ascii	"Enter the row you would like to target: \000"
	.align	2
.LC17:
	.ascii	"%d\000"
	.align	2
.LC18:
	.ascii	"\012 Would you like to reset or exit? (1 for Reset,"
	.ascii	" Any key for Exit) \000"
	.align	2
.LC19:
	.ascii	"Thanks for playing!\000"
	.align	2
.LC20:
	.ascii	"Out of range! You must choose between 1 and 5.\000"
	.align	2
.LC21:
	.ascii	"Not an integer! Please enter a number\000"
	.text
	.align	2
	.global	theRow
	.type	theRow, %function
theRow:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	ldr	r3, .L40
	mov	r0, r3
	bl	printf
	ldr	r2, .L40+4
	sub	r3, fp, #12
	mov	r0, r2
	mov	r1, r3
	bl	__isoc99_scanf
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #1
	bne	.L35
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L36
	ldr	r3, .L40+8
	mov	r0, r3
	bl	printf
	ldr	r2, .L40+4
	sub	r3, fp, #16
	mov	r0, r2
	mov	r1, r3
	bl	__isoc99_scanf
	ldr	r3, [fp, #-16]
	cmp	r3, #1
	bne	.L37
	bl	main
	b	.L36
.L37:
	ldr	r0, .L40+12
	bl	puts
	mov	r0, #0
	bl	exit
.L36:
	ldr	r3, [fp, #-12]
	cmp	r3, #5
	bgt	.L38
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bgt	.L39
.L38:
	ldr	r0, .L40+16
	bl	puts
	bl	getchar
	bl	theRow
	mov	r3, r0
	str	r3, [fp, #-12]
	b	.L39
.L35:
	ldr	r0, .L40+20
	bl	puts
	bl	getchar
	bl	theRow
	mov	r3, r0
	str	r3, [fp, #-12]
.L39:
	ldr	r3, [fp, #-12]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L41:
	.align	2
.L40:
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.size	theRow, .-theRow
	.section	.rodata
	.align	2
.LC22:
	.ascii	"Enter the column you would like to target: \000"
	.text
	.align	2
	.global	column
	.type	column, %function
column:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	ldr	r3, .L48
	mov	r0, r3
	bl	printf
	ldr	r2, .L48+4
	sub	r3, fp, #12
	mov	r0, r2
	mov	r1, r3
	bl	__isoc99_scanf
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #1
	bne	.L43
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L44
	ldr	r3, .L48+8
	mov	r0, r3
	bl	printf
	ldr	r2, .L48+4
	sub	r3, fp, #16
	mov	r0, r2
	mov	r1, r3
	bl	__isoc99_scanf
	ldr	r3, [fp, #-16]
	cmp	r3, #1
	bne	.L45
	bl	main
	b	.L44
.L45:
	ldr	r0, .L48+12
	bl	puts
	mov	r0, #0
	bl	exit
.L44:
	ldr	r3, [fp, #-12]
	cmp	r3, #5
	bgt	.L46
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bgt	.L47
.L46:
	ldr	r0, .L48+16
	bl	puts
	bl	column
	mov	r3, r0
	str	r3, [fp, #-12]
	b	.L47
.L43:
	ldr	r0, .L48+20
	bl	puts
	bl	getchar
	bl	column
	mov	r3, r0
	str	r3, [fp, #-12]
.L47:
	ldr	r3, [fp, #-12]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L49:
	.align	2
.L48:
	.word	.LC22
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.size	column, .-column
	.section	.rodata
	.align	2
.LC23:
	.ascii	"Boom (%d,%d)\012\000"
	.text
	.align	2
	.global	hit
	.type	hit, %function
hit:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L51
.L54:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #3
	ldr	r1, [fp, #-20]
	add	r3, r1, r3
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	.L52
	ldr	r3, [fp, #-16]
	add	r3, r3, #4
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #3
	ldr	r1, [fp, #-20]
	add	r3, r1, r3
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L52
	ldr	r1, .L55
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	add	r3, r3, #1
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	printf
	mov	r3, #1
	b	.L53
.L52:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L51:
	ldr	r3, [fp, #-8]
	cmp	r3, #2
	ble	.L54
	mov	r3, #0
.L53:
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L56:
	.align	2
.L55:
	.word	.LC23
	.size	hit, .-hit
	.section	.rodata
	.align	2
.LC24:
	.ascii	"clear\000"
	.align	2
.LC25:
	.ascii	"You have %d attempts left.\012\000"
	.align	2
.LC26:
	.ascii	"\012Turn %d: \012Row %d : %d ships\012Column %d : %"
	.ascii	"d ships\012\000"
	.text
	.align	2
	.global	tip
	.type	tip, %function
tip:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	ldr	r0, .L62
	bl	system
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	ldr	r2, .L62+4
	ldr	r1, [fp, #-36]
	ldr	r3, [fp, #-32]
	rsb	r3, r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	printf
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L58
.L61:
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	.L59
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L59:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	.L60
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L60:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L58:
	ldr	r3, [fp, #-16]
	cmp	r3, #2
	ble	.L61
	ldr	r1, .L62+8
	ldr	r3, [fp, #-32]
	add	r2, r3, #1
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	add	r3, r3, #1
	ldr	r0, [fp, #-24]
	add	r0, r0, #4
	ldr	r0, [r0, #0]
	add	r0, r0, #1
	str	r0, [sp, #0]
	ldr	r0, [fp, #-12]
	str	r0, [sp, #4]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	ldr	r3, [fp, #-8]
	bl	printf
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L63:
	.align	2
.L62:
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.size	tip, .-tip
	.align	2
	.global	refreshBoard
	.type	refreshBoard, %function
refreshBoard:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-12]
	bl	hit
	mov	r3, r0
	cmp	r3, #0
	beq	.L65
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #0]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	add	r2, r2, #4
	ldr	r2, [r2, #0]
	mov	r1, #1
	str	r1, [r3, r2, asl #2]
	b	.L64
.L65:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #0]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	add	r2, r2, #4
	ldr	r2, [r2, #0]
	mov	r1, #0
	str	r1, [r3, r2, asl #2]
.L64:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	refreshBoard, .-refreshBoard
	.section	.rodata
	.align	2
.LC27:
	.ascii	"Welcome to BattleShip!\000"
	.align	2
.LC28:
	.ascii	"******** GAME SETUP ********\000"
	.align	2
.LC29:
	.ascii	"How would you like hits to be represented\0121) X\012"
	.ascii	"2) H\0123) 1\0124) Y\012 \000"
	.align	2
.LC30:
	.ascii	"Enter option (1-4) or any key to exit:\000"
	.align	2
.LC31:
	.ascii	"\012Enter the maximum number of attempts allowed:\000"
	.align	2
.LC32:
	.ascii	"Number too small; Please enter another number:\000"
	.align	2
.LC33:
	.ascii	"Game Over!\000"
	.align	2
.LC34:
	.ascii	"\012 Would you like to try again? (1 for Yes, Any k"
	.ascii	"ey for No) \000"
	.align	2
.LC35:
	.ascii	"\012 Mazel Tov! You hit all 3 ships in %d attempts\012"
	.ascii	"\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 160
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #160
	mov	r3, #0
	str	r3, [fp, #-24]
	ldr	r0, .L80
	bl	system
	ldr	r0, .L80+4
	bl	puts
	ldr	r0, .L80+8
	bl	puts
	ldr	r3, .L80+12
	mov	r0, r3
	bl	printf
	ldr	r3, .L80+16
	mov	r0, r3
	bl	printf
	ldr	r2, .L80+20
	sub	r3, fp, #20
	mov	r0, r2
	mov	r1, r3
	bl	__isoc99_scanf
	str	r0, [fp, #-16]
	bl	getchar
	ldr	r3, .L80+24
	mov	r0, r3
	bl	printf
	b	.L68
.L70:
	ldr	r2, .L80+20
	sub	r3, fp, #24
	mov	r0, r2
	mov	r1, r3
	bl	__isoc99_scanf
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #1
	bne	.L69
	ldr	r3, [fp, #-24]
	cmp	r3, #3
	bgt	.L69
	mov	r3, #0
	str	r3, [fp, #-24]
	ldr	r3, .L80+28
	mov	r0, r3
	bl	printf
.L69:
	bl	getchar
.L68:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L70
	ldr	r3, [fp, #-20]
	cmp	r3, #1
	beq	.L71
	ldr	r3, [fp, #-20]
	cmp	r3, #2
	beq	.L71
	ldr	r3, [fp, #-20]
	cmp	r3, #3
	beq	.L71
	ldr	r3, [fp, #-20]
	cmp	r3, #4
	bne	.L72
.L71:
	ldr	r0, .L80
	bl	system
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	sub	r3, fp, #160
	mov	r0, r3
	bl	buildBoard
	sub	r3, fp, #48
	mov	r0, r3
	bl	makeShips
	ldr	r2, .L80+32
	ldr	r1, [fp, #-24]
	ldr	r3, [fp, #-8]
	rsb	r3, r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	printf
	mov	r0, #10
	bl	putchar
.L77:
	ldr	r3, [fp, #-20]
	sub	r2, fp, #160
	mov	r0, r2
	mov	r1, r3
	bl	displayBoard
	sub	r3, fp, #56
	mov	r0, r3
	bl	shoot
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	sub	r2, fp, #56
	sub	r3, fp, #48
	mov	r0, r2
	mov	r1, r3
	bl	hit
	mov	r3, r0
	cmp	r3, #0
	beq	.L73
	ldr	r3, [fp, #-24]
	sub	r1, fp, #56
	sub	r2, fp, #48
	mov	r0, r1
	mov	r1, r2
	ldr	r2, [fp, #-8]
	bl	tip
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	b	.L74
.L73:
	ldr	r3, [fp, #-24]
	sub	r1, fp, #56
	sub	r2, fp, #48
	mov	r0, r1
	mov	r1, r2
	ldr	r2, [fp, #-8]
	bl	tip
.L74:
	sub	r1, fp, #56
	sub	r2, fp, #48
	sub	r3, fp, #160
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	refreshBoard
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	bne	.L75
	ldr	r0, .L80+36
	bl	puts
	ldr	r3, .L80+40
	mov	r0, r3
	bl	printf
	ldr	r2, .L80+20
	sub	r3, fp, #60
	mov	r0, r2
	mov	r1, r3
	bl	__isoc99_scanf
	ldr	r3, [fp, #-60]
	cmp	r3, #1
	bne	.L76
	bl	main
	b	.L75
.L76:
	ldr	r0, .L80+44
	bl	puts
	mov	r0, #0
	bl	exit
.L75:
	ldr	r3, [fp, #-12]
	cmp	r3, #3
	bne	.L77
	ldr	r3, .L80+48
	mov	r0, r3
	ldr	r1, [fp, #-8]
	bl	printf
	ldr	r3, [fp, #-20]
	sub	r2, fp, #160
	mov	r0, r2
	mov	r1, r3
	bl	displayBoard
	ldr	r3, .L80+40
	mov	r0, r3
	bl	printf
	ldr	r2, .L80+20
	sub	r3, fp, #60
	mov	r0, r2
	mov	r1, r3
	bl	__isoc99_scanf
	ldr	r3, [fp, #-60]
	cmp	r3, #1
	bne	.L78
	bl	main
	mov	r0, r0	@ nop
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L78:
	ldr	r0, .L80+44
	bl	puts
	mov	r0, #0
	bl	exit
.L72:
	ldr	r0, .L80+44
	bl	puts
	mov	r0, #0
	bl	exit
.L81:
	.align	2
.L80:
	.word	.LC24
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	.LC30
	.word	.LC17
	.word	.LC31
	.word	.LC32
	.word	.LC25
	.word	.LC33
	.word	.LC34
	.word	.LC19
	.word	.LC35
	.size	main, .-main
	.ident	"GCC: (Debian 4.6.3-14+rpi1) 4.6.3"
	.section	.note.GNU-stack,"",%progbits
