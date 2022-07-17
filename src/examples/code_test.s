	.text
	.ent main
main:		
  	addiu	$sp,$sp,-8
	sw	$16,4($sp)
	sw	$4,8($sp)
	sw	$5,12($sp)
	lw	$2,8($sp)
	lbu	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,29
	lbu	$2,0($2)
	move	$4,$2
	lui	$2,0x1001 # sbox
	addu	$2,$4,$2
	lbu	$4,0($2)
    bne $5, $2, $L5
	add $0, $0, $0

$L4:
	lw $4, 0($6)
	lw $2, 0($7)
	add $5, $4, $2
	sw $5, 0($6)
	addiu $12, $8, 2
	addiu $7, $12, 1
	bne $7, $0, $L5
	add $0, $0, $0
	
	sub $6, $0, $5
	sll $6, $3, 4
	addiu $5, $6, -2
	sw $15, 12($7)	
	sw $10, -4($6)
	j $L4
	add $0, $0, $0

$L5:
	sub $8, $10, $15 	
	sll $10, $10, 4	
	sw $8, 8($7)	
	add $10, $8, $10	
	sw $10, 12($7)
	jr $31
	add $0, $0, $0
	
	.end main
