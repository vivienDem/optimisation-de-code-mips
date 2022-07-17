	.file	1 "max_fcts.c"
	.globl	tab
	.data
	.align	2
tab:
	.word	23
	.word	45
	.word	-6
	.word	120
	.word	2
	.word	11
	.word	23
	.globl	espace
espace:
	.byte	32
	.globl	rt
rt:
	.byte	10
	.text
	.globl	max2
	.ent	max2
max2:
	# vars= 0, regs= 0/0, args= 0, gp= 0
	sw	$4,0($sp)
	sw	$5,4($sp)
	lw	$3,0($sp)
	lw	$2,4($sp)
	slt	$2,$3,$2
	beq	$2,$0,$L2
	nop

	lw	$2,4($sp)
	j	$L3
	nop

$L2:
	lw	$2,0($sp)
$L3:
	jr	$31
	nop

	.end	max2

	.globl	max
	.ent	max
max:
	# vars= 0, regs= 0/0, args= 0, gp= 0
	sw	$4,0($sp)
	sw	$5,4($sp)
	sw	$6,8($sp)
	lw	$3,0($sp)
	lw	$2,4($sp)
	slt	$2,$3,$2
	beq	$2,$0,$L5
	nop

	lw	$3,4($sp)
	lw	$2,8($sp)
	slt	$2,$3,$2
	beq	$2,$0,$L6
	nop

	lw	$2,8($sp)
	j	$L7
	nop

$L6:
	lw	$2,4($sp)
	j	$L7
	nop

$L5:
	lw	$3,0($sp)
	lw	$2,8($sp)
	slt	$2,$3,$2
	beq	$2,$0,$L8
	nop

	lw	$2,8($sp)
	j	$L7
	nop

$L8:
	lw	$2,0($sp)
$L7:
	jr	$31
	nop

	.end	max

	.globl	max_tab
	.ent	max_tab
max_tab:
	# vars= 8, regs= 0/0, args= 0, gp= 0
	addiu	$sp,$sp,-8
	sw	$4,8($sp)
	sw	$5,12($sp)
	addiu	$2, $0, -1			# 0xffffffffffffffff
	sw	$2,4($sp)
	sw	$0,0($sp)
	j	$L10
	nop

$L12:
	lw	$2,0($sp)
	sll	$2,$2,2
	lw	$3,8($sp)
	addu	$2,$3,$2
	lw	$2,0($2)
	lw	$3,4($sp)
	slt	$2,$3,$2
	beq	$2,$0,$L11
	nop

	lw	$2,0($sp)
	sll	$2,$2,2
	lw	$3,8($sp)
	addu	$2,$3,$2
	lw	$2,0($2)
	sw	$2,4($sp)
$L11:
	lw	$2,0($sp)
	addiu	$2,$2,1
	sw	$2,0($sp)
$L10:
	lw	$3,0($sp)
	lw	$2,12($sp)
	slt	$2,$3,$2
	bne	$2,$0,$L12
	nop

	lw	$2,4($sp)
	addiu	$sp,$sp,8
	jr	$31
	nop

	.end	max_tab

	.globl	main
	.ent	main
main:
	# vars= 0, regs= 1/0, args= 16, gp= 0
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$4,24($sp)
	sw	$5,28($sp)
	ori	$5,$0,5			# 0x5
	ori	$4,$0,23		# 0x17
	jal	max2
	nop

	move	$4,$2
	ori     $2, $0, 1
	syscall
	nop

	lui	$2, 0x1001
	ori     $2, $2, 0x1d
	lb	$2,($2)
	move	$4,$2
	ori     $2, $0, 11
	syscall
	nop

	ori	$6,$0,8			# 0x8
	ori	$5,$0,16		# 0x10
	ori	$4,$0,3			# 0x3
	jal	max
	nop

	move	$4,$2
	ori     $2, $0, 1
	syscall
	nop

	lui	$2, 0x1001
	ori     $2, $2, 0x1d
	lb	$2,($2)
	move	$4,$2
	ori     $2, $0, 11
	syscall
	nop

	ori	$5,$0,7			# 0x7
	lui	$4, 0x1001
	jal	max_tab
	nop

	move	$4,$2
	ori     $2, $0, 1
	syscall
	nop

	lui	$2, 0x1001
	ori     $2, $2, 0x1d
	lb	$2,($2)
	move	$4,$2
	ori     $2, $0, 11
	syscall
	nop

	ori     $2, $0, 10
	syscall
	nop
	
	move	$2,$0
	lw	$31,20($sp)
	addiu	$sp,$sp,24
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 7.1.0"
