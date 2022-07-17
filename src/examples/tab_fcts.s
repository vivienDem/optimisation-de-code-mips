	.file	1 "tab_fcts.c"
	.globl	tabA
	.data
	.align	2
tabA:
	.word	23
	.word	45
	.word	-6
	.word	120
	.word	2
	.word	11
	.word	23
	.word	-5
	.word	12
	.word	14
	.globl	tabB
	.align	2
tabB:
	.word	13
	.word	5
	.word	-16
	.word	12
	.word	24
	.word	115
	.word	-123
	.word	-55
	.word	57
	.word	0
	.globl	tabC
	.align	2
tabC:
	.space	40
	.globl	tabD
	.align	2
tabD:
	.space	40
	.globl	espace
	.data
espace:
	.byte	32
	.globl	rt
rt:
	.byte	10

	.text
	.globl	sum
	.ent	sum
sum:
	# vars= 8, regs= 0/0, args= 0, gp= 0
	addiu	$sp,$sp,-8
	sw	$4,8($sp)
	sw	$5,12($sp)
	sw	$6,16($sp)
	sw	$7,20($sp)
	sw	$0,0($sp)
	j	$L2
	nop

$L3:
	lw	$2,0($sp)
	sll	$2,$2,2
	lw	$3,8($sp)
	addu	$2,$3,$2
	lw	$4,0($2)
	lw	$2,0($sp)
	sll	$2,$2,2
	lw	$3,12($sp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,0($sp)
	sll	$2,$2,2
	lw	$5,16($sp)
	addu	$2,$5,$2
	addu	$3,$4,$3
	sw	$3,0($2)
	lw	$2,0($sp)
	addiu	$2,$2,1
	sw	$2,0($sp)
$L2:
	lw	$3,0($sp)
	lw	$2,20($sp)
	slt	$2,$3,$2
	bne	$2,$0,$L3
	nop

	nop
	addiu	$sp,$sp,8
	jr	$31
	nop

	.end	sum

	.globl	max_min_tab
	.ent	max_min_tab
max_min_tab:
	# vars= 8, regs= 0/0, args= 0, gp= 0
	addiu	$sp,$sp,-8
	sw	$4,8($sp)
	sw	$5,12($sp)
	sw	$6,16($sp)
	sw	$7,20($sp)
	sw	$0,0($sp)
	j	$L6
	nop

$L9:
	lw	$2,0($sp)
	sll	$2,$2,2
	lw	$3,8($sp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,0($sp)
	sll	$2,$2,2
	lw	$4,12($sp)
	addu	$2,$4,$2
	lw	$2,0($2)
	slt	$2,$3,$2
	beq	$2,$0,$L7
	nop

	lw	$2,0($sp)
	sll	$2,$2,2
	lw	$3,12($sp)
	addu	$3,$3,$2
	lw	$2,0($sp)
	sll	$2,$2,2
	lw	$4,16($sp)
	addu	$2,$4,$2
	lw	$3,0($3)
	sw	$3,0($2)
	lw	$2,0($sp)
	sll	$2,$2,2
	lw	$3,8($sp)
	addu	$3,$3,$2
	lw	$2,0($sp)
	sll	$2,$2,2
	lw	$4,20($sp)
	addu	$2,$4,$2
	lw	$3,0($3)
	sw	$3,0($2)
	j	$L8
	nop

$L7:
	lw	$2,0($sp)
	sll	$2,$2,2
	lw	$3,8($sp)
	addu	$3,$3,$2
	lw	$2,0($sp)
	sll	$2,$2,2
	lw	$4,16($sp)
	addu	$2,$4,$2
	lw	$3,0($3)
	sw	$3,0($2)
	lw	$2,0($sp)
	sll	$2,$2,2
	lw	$3,12($sp)
	addu	$3,$3,$2
	lw	$2,0($sp)
	sll	$2,$2,2
	lw	$4,20($sp)
	addu	$2,$4,$2
	lw	$3,0($3)
	sw	$3,0($2)
$L8:
	lw	$2,0($sp)
	addiu	$2,$2,1
	sw	$2,0($sp)
$L6:
	lw	$3,0($sp)
	lw	$2,24($sp)
	slt	$2,$3,$2
	bne	$2,$0,$L9
	nop

	move	$2,$0
	addiu	$sp,$sp,8
	jr	$31
	nop
	.end	max_min_tab
	
	.globl	sum_tab
	.ent	sum_tab
sum_tab:
	# vars= 8, regs= 0/0, args= 0, gp= 0
	addiu	$sp,$sp,-8
	sw	$4,8($sp)
	sw	$5,12($sp)
	sw	$0,4($sp)
	sw	$0,0($sp)
	j	$L12
	nop

$L13:
	lw	$2,0($sp)
	sll	$2,$2,2
	lw	$3,8($sp)
	addu	$2,$3,$2
	lw	$2,0($2)
	lw	$3,4($sp)
	addu	$2,$3,$2
	sw	$2,4($sp)
	lw	$2,0($sp)
	addiu	$2,$2,1
	sw	$2,0($sp)
$L12:
	lw	$3,0($sp)
	lw	$2,12($sp)
	slt	$2,$3,$2
	bne	$2,$0,$L13
	nop

	lw	$2,4($sp)
	addiu	$sp,$sp,8
	jr	$31
	nop
	.end	sum_tab
	
	.globl	sum_tab_unroll
	.ent	sum_tab_unroll
sum_tab_unroll:
	# vars= 8, regs= 0/0, args= 0, gp= 0
	addiu	$sp,$sp,-8
	sw	$4,8($sp)
	sw	$5,12($sp)
	sw	$0,4($sp)
	sw	$0,0($sp)
	j	$L16
	nop

$L17:
	lw	$2,0($sp)
	sll	$2,$2,2
	lw	$3,8($sp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,0($sp)
	addiu	$2,$2,1
	sll	$2,$2,2
	lw	$4,8($sp)
	addu	$2,$4,$2
	lw	$2,0($2)
	addu	$3,$3,$2
	lw	$2,0($sp)
	addiu	$2,$2,2
	sll	$2,$2,2
	lw	$4,8($sp)
	addu	$2,$4,$2
	lw	$2,0($2)
	addu	$3,$3,$2
	lw	$2,0($sp)
	addiu	$2,$2,3
	sll	$2,$2,2
	lw	$4,8($sp)
	addu	$2,$4,$2
	lw	$2,0($2)
	addu	$2,$3,$2
	lw	$3,4($sp)
	addu	$2,$3,$2
	sw	$2,4($sp)
	lw	$2,0($sp)
	addiu	$2,$2,4
	sw	$2,0($sp)
$L16:
	lw	$2,0($sp)
	addiu	$2,$2,3
	lw	$3,12($sp)
	slt	$2,$2,$3
	bne	$2,$0,$L17
	nop

	j	$L18
	nop

$L19:
	lw	$2,0($sp)
	sll	$2,$2,2
	lw	$3,8($sp)
	addu	$2,$3,$2
	lw	$2,0($2)
	lw	$3,4($sp)
	addu	$2,$3,$2
	sw	$2,4($sp)
	lw	$2,0($sp)
	addiu	$2,$2,1
	sw	$2,0($sp)
$L18:
	lw	$3,0($sp)
	lw	$2,12($sp)
	slt	$2,$3,$2
	bne	$2,$0,$L19
	nop

	lw	$2,4($sp)
	addiu	$sp,$sp,8
	jr	$31
	nop

	.end	sum_tab_unroll

	.globl	print_tab
	.ent	print_tab
print_tab:
	# vars= 8, regs= 1/0, args= 16, gp= 0
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$4,32($sp)
	sw	$5,36($sp)
	sw	$0,16($sp)
	j	$L22
	nop

$L23:
	lw	$2,16($sp)
	sll	$2,$2,2
	lw	$3,32($sp)
	addu	$2,$3,$2
	lw	$2,0($2)
	move	$4,$2
	ori	$2, $0, 1
	syscall
	nop

	lui     $2, 0x1001
	ori     $2, $2, 0xa0 
	lb	$2,($2)
	move	$4,$2
	ori     $2, $0, 11
	syscall
	nop

	lw	$2,16($sp)
	addiu	$2,$2,1
	sw	$2,16($sp)
$L22:
	lw	$3,16($sp)
	lw	$2,36($sp)
	slt	$2,$3,$2
	bne	$2,$0,$L23
	nop

	lui     $2, 0x1001
	ori     $2, $2, 0xa1 
	lb	$2,($2)
	move	$4, $2
	ori     $2, $0, 11
	syscall
	nop
	
	lw	$31,28($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop


	.end	print_tab

	.globl	main
	.ent	main
main:
	# vars= 8, regs= 1/0, args= 24, gp= 0
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$4,40($sp)
	sw	$5,44($sp)
	ori	$2, $0, 10			# 0xa
	sw	$2,24($sp)
	lw	$5,24($sp)
	lui     $4, 0x1001
	jal	sum_tab
	nop

	sw	$2,28($sp)
	lw	$4,28($sp)
	ori     $2, $0, 1
	syscall
	nop

	lui     $2, 0x1001
	ori     $2, $2, 0xa0 # espace
	lb	$2, ($2)
	move	$4,$2
	ori     $2, $0, 11
	syscall
	nop

	lui     $2, 0x1001
	ori     $2, $2, 0xa1  # rt
	lb	$2, ($2)
	move	$4,$2
	ori     $2, $0, 11
	syscall
	nop

	lw	$5,24($sp)
	lui     $4, 0x1001     # tabA
	jal	sum_tab_unroll
	nop

	sw	$2,28($sp)
	lw	$4,28($sp)
	ori     $2, $0, 1
	syscall
	nop


	lui     $2, 0x1001
	ori     $2, $2, 0xa0 # espace
	lb	$2, ($2)
	move	$4,$2
	ori     $2, $0, 11
	syscall
	nop

	lui     $2, 0x1001
	ori     $2, $2, 0xa1  
	lb	$2, ($2)
	move	$4,$2
	ori     $2, $0, 11
	syscall
	nop


	lw	$7,24($sp)
	lui     $4, 0x1001    
	ori     $6, $4, 0x50   
	ori     $5, $4, 0x28  
	jal	sum
	nop

	lw	$5,24($sp)
	lui     $4, 0x1001    
 	ori     $4, $4, 0x50  
	jal	print_tab
	nop

	lw	$2,24($sp)
	sw	$2,16($sp)
	lui     $4, 0x1001    
 	ori     $7, $4, 0x78   
	ori     $6, $4, 0x50  
	ori     $5, $4, 0x28  
	jal	max_min_tab
	nop

	lw	$5,24($sp)
	lui     $4, 0x1001    
 	ori     $4, $4, 0x50   # tabC	
	jal	print_tab
	nop

	lw	$5,24($sp)
	lui     $4, 0x1001    
 	ori     $4, $4, 0x78   # tabD	
	jal	print_tab
	nop

	ori     $2, $0, 10
	syscall
	nop
	
	move	$2,$0
	lw	$31,36($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 7.1.0"
