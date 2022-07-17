	.file	1 "mat_mul.c"
	.globl	A
	.data
	.align	2
A:
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	16
	.globl	Ident
	.align	2
Ident:
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.globl	C

	.align	2
C:
	.space	64
	.globl	espace
	.data
espace:
	.byte	32
	.globl	rt
rt:
	.byte	10
	.text
	.globl	mat_mul
	.ent	mat_mul
mat_mul:
	# vars= 24, regs= 0/0, args= 0, gp= 0
	addiu	$sp,$sp,-24
	sw	$4,24($sp)
	sw	$5,28($sp)
	sw	$6,32($sp)
	sw	$0,12($sp)
	sw	$0,0($sp)
	j	$L2
	nop

$L5:
	sw	$0,4($sp)
	b	$L3
	nop

$L4:
	lw	$2,0($sp)
	sll	$2,$2,4
	lw	$3,32($sp)
	addu	$3,$3,$2
	lw	$2,4($sp)
	sll	$2,$2,2
	addu	$2,$3,$2
	sw	$0,0($2)
	lw	$2,4($sp)
	addiu	$2,$2,1
	sw	$2,4($sp)
$L3:
	lw	$2,4($sp)
	slti	$2,$2,4
	bne	$2,$0,$L4
	nop

	lw	$2,0($sp)
	addiu	$2,$2,1
	sw	$2,0($sp)
$L2:
	lw	$2,0($sp)
	slti	$2,$2,4
	bne	$2,$0,$L5
	nop

	sw	$0,0($sp)
	j	$L6
	nop

$L11:
	sw	$0,4($sp)
	j	$L7
	nop

$L10:
	sw	$0,8($sp)
	j	$L8
	nop

$L9:
	lw	$2,0($sp)
	sll	$2,$2,4
	lw	$3,24($sp)
	addu	$3,$3,$2
	lw	$2,8($sp)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,8($sp)
	sll	$2,$2,4
	lw	$4,28($sp)
	addu	$4,$4,$2
	lw	$2,4($sp)
	sll	$2,$2,2
	addu	$2,$4,$2
	lw	$2,0($2)
	mul	$2,$3,$2
	sw	$2,16($sp)
	lw	$3,12($sp)
	lw	$2,16($sp)
	addu	$2,$3,$2
	sw	$2,12($sp)
	lw	$2,0($sp)
	sll	$2,$2,4
	lw	$3,32($sp)
	addu	$3,$3,$2
	lw	$2,4($sp)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,0($sp)
	sll	$2,$2,4
	lw	$4,32($sp)
	addu	$4,$4,$2
	lw	$2,16($sp)
	addu	$3,$3,$2
	lw	$2,4($sp)
	sll	$2,$2,2
	addu	$2,$4,$2
	sw	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,1
	sw	$2,8($sp)
$L8:
	lw	$2,8($sp)
	slti	$2,$2,4
	bne	$2,$0,$L9
	nop

	lw	$2,4($sp)
	addiu	$2,$2,1
	sw	$2,4($sp)
$L7:
	lw	$2,4($sp)
	slti	$2,$2,4
	bne	$2,$0,$L10
	nop

	lw	$2,0($sp)
	addiu	$2,$2,1
	sw	$2,0($sp)
$L6:
	lw	$2,0($sp)
	slti	$2,$2,4
	bne	$2,$0,$L11
	nop

	lw	$2,12($sp)
	addiu	$sp,$sp,24
	jr	$31
	nop

	.end	mat_mul

	.globl	print_mat
	.ent	print_mat
print_mat:
	# vars= 8, regs= 1/0, args= 16, gp= 0
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$4,32($sp)
	sw	$0,16($sp)
	j	$L14
	nop

$L17:
	sw	$0,20($sp)
	j	$L15
	nop

$L16:
	lw	$2,16($sp)
	sll	$2,$2,4
	lw	$3,32($sp)
	addu	$3,$3,$2
	lw	$2,20($sp)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$2,0($2)
	move	$4,$2
	ori     $2, $0, 1
	syscall
	nop

        lui      $2, 0x1001
	ori     $2, $2, 0xc0
	lb	$2,($2)
	move	$4,$2
	ori     $2, $0, 11
	syscall
	nop

	lw	$2,20($sp)
	addiu	$2,$2,1
	sw	$2,20($sp)
$L15:
	lw	$2,20($sp)
	slti	$2,$2,4
	bne	$2,$0,$L16
	nop

        lui      $2, 0x1001
	ori     $2, $2, 0xc1
	lb	$2,($2)
	move	$4,$2
	ori     $2, $0, 11
	syscall
	nop

	lw	$2,16($sp)
	addiu	$2,$2,1
	sw	$2,16($sp)
$L14:
	lw	$2,16($sp)
	slti	$2,$2,4
	bne	$2,$0,$L17
	nop

	nop
	lw	$31,28($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.end	print_mat

	.globl	mat_mul_4
	.ent	mat_mul_4
mat_mul_4:
	# vars= 16, regs= 0/0, args= 0, gp= 0
	addiu	$sp,$sp,-16
	sw	$4,16($sp)
	sw	$5,20($sp)
	sw	$6,24($sp)
	sw	$0,8($sp)
	sw	$0,0($sp)
	j	$L19
	nop

$L22:
	sw	$0,4($sp)
	b	$L20
	nop

$L21:
	lw	$2,0($sp)
	sll	$2,$2,4
	lw	$3,24($sp)
	addu	$3,$3,$2
	lw	$2,4($sp)
	sll	$2,$2,2
	addu	$2,$3,$2
	sw	$0,0($2)
	lw	$2,4($sp)
	addiu	$2,$2,1
	sw	$2,4($sp)
$L20:
	lw	$2,4($sp)
	slti	$2,$2,4
	bne	$2,$0,$L21
	nop

	lw	$2,0($sp)
	addiu	$2,$2,1
	sw	$2,0($sp)
$L19:
	lw	$2,0($sp)
	slti	$2,$2,4
	bne	$2,$0,$L22
	nop

	sw	$0,0($sp)
	j	$L23
	nop

$L26:
	sw	$0,4($sp)
	j	$L24
	nop

$L25:
	lw	$2,0($sp)
	sll	$2,$2,4
	lw	$3,16($sp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$4,20($sp)
	lw	$2,4($sp)
	sll	$2,$2,2
	addu	$2,$4,$2
	lw	$2,0($2)
	mul	$3,$3,$2
	lw	$2,0($sp)
	sll	$2,$2,4
	lw	$4,16($sp)
	addu	$2,$4,$2
	lw	$4,4($2)
	lw	$2,20($sp)
	addiu	$5,$2,16
	lw	$2,4($sp)
	sll	$2,$2,2
	addu	$2,$5,$2
	lw	$2,0($2)
	mul	$2,$4,$2
	addu	$3,$3,$2
	lw	$2,0($sp)
	sll	$2,$2,4
	lw	$4,16($sp)
	addu	$2,$4,$2
	lw	$4,8($2)
	lw	$2,20($sp)
	addiu	$5,$2,32
	lw	$2,4($sp)
	sll	$2,$2,2
	addu	$2,$5,$2
	lw	$2,0($2)
	mul	$2,$4,$2
	addu	$3,$3,$2
	lw	$2,0($sp)
	sll	$2,$2,4
	lw	$4,16($sp)
	addu	$2,$4,$2
	lw	$4,12($2)
	lw	$2,20($sp)
	addiu	$5,$2,48
	lw	$2,4($sp)
	sll	$2,$2,2
	addu	$2,$5,$2
	lw	$2,0($2)
	mul	$2,$4,$2
	addu	$2,$3,$2
	sw	$2,12($sp)
	lw	$3,8($sp)
	lw	$2,12($sp)
	addu	$2,$3,$2
	sw	$2,8($sp)
	lw	$2,0($sp)
	sll	$2,$2,4
	lw	$3,24($sp)
	addu	$3,$3,$2
	lw	$2,4($sp)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,0($sp)
	sll	$2,$2,4
	lw	$4,24($sp)
	addu	$4,$4,$2
	lw	$2,12($sp)
	addu	$3,$3,$2
	lw	$2,4($sp)
	sll	$2,$2,2
	addu	$2,$4,$2
	sw	$3,0($2)
	lw	$2,4($sp)
	addiu	$2,$2,1
	sw	$2,4($sp)
$L24:
	lw	$2,4($sp)
	slti	$2,$2,4
	bne	$2,$0,$L25
	nop

	lw	$2,0($sp)
	addiu	$2,$2,1
	sw	$2,0($sp)
$L23:
	lw	$2,0($sp)
	slti	$2,$2,4
	bne	$2,$0,$L26
	nop

	lw	$2,8($sp)
	addiu	$sp,$sp,16
	jr	$31
	nop
	.end	mat_mul_4

	.globl	main
	.ent	main
main:
	# vars= 0, regs= 1/0, args= 16, gp= 0
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$4,24($sp)
	sw	$5,28($sp)
	lui	$6, 0x1001  # C
	ori     $6, $6, 0x80   
	lui	$5, 0x1001   # Ident
	ori 	$5, $5, 0x40
	lui 	$4, 0x1001   # A 
	jal	mat_mul
	nop

	lui	$4, 0x1001
	ori     $4, 0x80
	jal	print_mat
	nop

	lui	$6, 0x1001  # C
	ori     $6, $6, 0x80   
	lui	$5, 0x1001   # Ident
	ori 	$5, $5, 0x40
	lui 	$4, 0x1001   # A 
	jal	mat_mul_4
	nop

	lui	$4, 0x1001
	ori     $4, 0x80
	jal	print_mat
	nop

	ori     $2, $0, 10
	syscall
	nop
	
	move	$2,$0
	lw	$31,20($sp)
	addiu	$sp,$sp,24
	jr	$31
	nop

	.end	main
	.ident	"GCC: (GNU) 7.1.0"
