	.file	1 "aes_ca.c"
	.text
	.globl	strncompare
	.ent	strncompare
strncompare:
	# vars= 0, regs= 0/0, args= 0, gp= 0
	sw	$4,0($sp)
	sw	$5,4($sp)
	move	$2,$6
	sb	$2,8($sp)
	b	$L2
	nop

$L5:
	lw	$2,0($sp)
	lbu	$3,0($2)
	lw	$2,4($sp)
	lbu	$2,0($2)
	beq	$3,$2,$L3
	nop

	ori	$2, $0, 1			# 0x1
	b	$L4
	nop

$L3:
	lw	$2,0($sp)
	addiu	$2,$2,1
	sw	$2,0($sp)
	lw	$2,4($sp)
	addiu	$2,$2,1
	sw	$2,4($sp)
	lbu	$2,8($sp)
	addiu	$2,$2,-1
	sb	$2,8($sp)
$L2:
	lbu	$2,8($sp)
	bne	$2,$0,$L5
	nop

	move	$2,$0
$L4:
	jr	$31
	nop

	.end	strncompare
	.globl	sbox
	.data
	.align	2
sbox:
	.byte	99
	.byte	124
	.byte	119
	.byte	123
	.byte	-14
	.byte	107
	.byte	111
	.byte	-59
	.byte	48
	.byte	1
	.byte	103
	.byte	43
	.byte	-2
	.byte	-41
	.byte	-85
	.byte	118
	.byte	-54
	.byte	-126
	.byte	-55
	.byte	125
	.byte	-6
	.byte	89
	.byte	71
	.byte	-16
	.byte	-83
	.byte	-44
	.byte	-94
	.byte	-81
	.byte	-100
	.byte	-92
	.byte	114
	.byte	-64
	.byte	-73
	.byte	-3
	.byte	-109
	.byte	38
	.byte	54
	.byte	63
	.byte	-9
	.byte	-52
	.byte	52
	.byte	-91
	.byte	-27
	.byte	-15
	.byte	113
	.byte	-40
	.byte	49
	.byte	21
	.byte	4
	.byte	-57
	.byte	35
	.byte	-61
	.byte	24
	.byte	-106
	.byte	5
	.byte	-102
	.byte	7
	.byte	18
	.byte	-128
	.byte	-30
	.byte	-21
	.byte	39
	.byte	-78
	.byte	117
	.byte	9
	.byte	-125
	.byte	44
	.byte	26
	.byte	27
	.byte	110
	.byte	90
	.byte	-96
	.byte	82
	.byte	59
	.byte	-42
	.byte	-77
	.byte	41
	.byte	-29
	.byte	47
	.byte	-124
	.byte	83
	.byte	-47
	.byte	0
	.byte	-19
	.byte	32
	.byte	-4
	.byte	-79
	.byte	91
	.byte	106
	.byte	-53
	.byte	-66
	.byte	57
	.byte	74
	.byte	76
	.byte	88
	.byte	-49
	.byte	-48
	.byte	-17
	.byte	-86
	.byte	-5
	.byte	67
	.byte	77
	.byte	51
	.byte	-123
	.byte	69
	.byte	-7
	.byte	2
	.byte	127
	.byte	80
	.byte	60
	.byte	-97
	.byte	-88
	.byte	81
	.byte	-93
	.byte	64
	.byte	-113
	.byte	-110
	.byte	-99
	.byte	56
	.byte	-11
	.byte	-68
	.byte	-74
	.byte	-38
	.byte	33
	.byte	16
	.byte	-1
	.byte	-13
	.byte	-46
	.byte	-51
	.byte	12
	.byte	19
	.byte	-20
	.byte	95
	.byte	-105
	.byte	68
	.byte	23
	.byte	-60
	.byte	-89
	.byte	126
	.byte	61
	.byte	100
	.byte	93
	.byte	25
	.byte	115
	.byte	96
	.byte	-127
	.byte	79
	.byte	-36
	.byte	34
	.byte	42
	.byte	-112
	.byte	-120
	.byte	70
	.byte	-18
	.byte	-72
	.byte	20
	.byte	-34
	.byte	94
	.byte	11
	.byte	-37
	.byte	-32
	.byte	50
	.byte	58
	.byte	10
	.byte	73
	.byte	6
	.byte	36
	.byte	92
	.byte	-62
	.byte	-45
	.byte	-84
	.byte	98
	.byte	-111
	.byte	-107
	.byte	-28
	.byte	121
	.byte	-25
	.byte	-56
	.byte	55
	.byte	109
	.byte	-115
	.byte	-43
	.byte	78
	.byte	-87
	.byte	108
	.byte	86
	.byte	-12
	.byte	-22
	.byte	101
	.byte	122
	.byte	-82
	.byte	8
	.byte	-70
	.byte	120
	.byte	37
	.byte	46
	.byte	28
	.byte	-90
	.byte	-76
	.byte	-58
	.byte	-24
	.byte	-35
	.byte	116
	.byte	31
	.byte	75
	.byte	-67
	.byte	-117
	.byte	-118
	.byte	112
	.byte	62
	.byte	-75
	.byte	102
	.byte	72
	.byte	3
	.byte	-10
	.byte	14
	.byte	97
	.byte	53
	.byte	87
	.byte	-71
	.byte	-122
	.byte	-63
	.byte	29
	.byte	-98
	.byte	-31
	.byte	-8
	.byte	-104
	.byte	17
	.byte	105
	.byte	-39
	.byte	-114
	.byte	-108
	.byte	-101
	.byte	30
	.byte	-121
	.byte	-23
	.byte	-50
	.byte	85
	.byte	40
	.byte	-33
	.byte	-116
	.byte	-95
	.byte	-119
	.byte	13
	.byte	-65
	.byte	-26
	.byte	66
	.byte	104
	.byte	65
	.byte	-103
	.byte	45
	.byte	15
	.byte	-80
	.byte	84
	.byte	-69
	.byte	22
	.globl	sboxinv
	.align	2
sboxinv:
	.byte	82
	.byte	9
	.byte	106
	.byte	-43
	.byte	48
	.byte	54
	.byte	-91
	.byte	56
	.byte	-65
	.byte	64
	.byte	-93
	.byte	-98
	.byte	-127
	.byte	-13
	.byte	-41
	.byte	-5
	.byte	124
	.byte	-29
	.byte	57
	.byte	-126
	.byte	-101
	.byte	47
	.byte	-1
	.byte	-121
	.byte	52
	.byte	-114
	.byte	67
	.byte	68
	.byte	-60
	.byte	-34
	.byte	-23
	.byte	-53
	.byte	84
	.byte	123
	.byte	-108
	.byte	50
	.byte	-90
	.byte	-62
	.byte	35
	.byte	61
	.byte	-18
	.byte	76
	.byte	-107
	.byte	11
	.byte	66
	.byte	-6
	.byte	-61
	.byte	78
	.byte	8
	.byte	46
	.byte	-95
	.byte	102
	.byte	40
	.byte	-39
	.byte	36
	.byte	-78
	.byte	118
	.byte	91
	.byte	-94
	.byte	73
	.byte	109
	.byte	-117
	.byte	-47
	.byte	37
	.byte	114
	.byte	-8
	.byte	-10
	.byte	100
	.byte	-122
	.byte	104
	.byte	-104
	.byte	22
	.byte	-44
	.byte	-92
	.byte	92
	.byte	-52
	.byte	93
	.byte	101
	.byte	-74
	.byte	-110
	.byte	108
	.byte	112
	.byte	72
	.byte	80
	.byte	-3
	.byte	-19
	.byte	-71
	.byte	-38
	.byte	94
	.byte	21
	.byte	70
	.byte	87
	.byte	-89
	.byte	-115
	.byte	-99
	.byte	-124
	.byte	-112
	.byte	-40
	.byte	-85
	.byte	0
	.byte	-116
	.byte	-68
	.byte	-45
	.byte	10
	.byte	-9
	.byte	-28
	.byte	88
	.byte	5
	.byte	-72
	.byte	-77
	.byte	69
	.byte	6
	.byte	-48
	.byte	44
	.byte	30
	.byte	-113
	.byte	-54
	.byte	63
	.byte	15
	.byte	2
	.byte	-63
	.byte	-81
	.byte	-67
	.byte	3
	.byte	1
	.byte	19
	.byte	-118
	.byte	107
	.byte	58
	.byte	-111
	.byte	17
	.byte	65
	.byte	79
	.byte	103
	.byte	-36
	.byte	-22
	.byte	-105
	.byte	-14
	.byte	-49
	.byte	-50
	.byte	-16
	.byte	-76
	.byte	-26
	.byte	115
	.byte	-106
	.byte	-84
	.byte	116
	.byte	34
	.byte	-25
	.byte	-83
	.byte	53
	.byte	-123
	.byte	-30
	.byte	-7
	.byte	55
	.byte	-24
	.byte	28
	.byte	117
	.byte	-33
	.byte	110
	.byte	71
	.byte	-15
	.byte	26
	.byte	113
	.byte	29
	.byte	41
	.byte	-59
	.byte	-119
	.byte	111
	.byte	-73
	.byte	98
	.byte	14
	.byte	-86
	.byte	24
	.byte	-66
	.byte	27
	.byte	-4
	.byte	86
	.byte	62
	.byte	75
	.byte	-58
	.byte	-46
	.byte	121
	.byte	32
	.byte	-102
	.byte	-37
	.byte	-64
	.byte	-2
	.byte	120
	.byte	-51
	.byte	90
	.byte	-12
	.byte	31
	.byte	-35
	.byte	-88
	.byte	51
	.byte	-120
	.byte	7
	.byte	-57
	.byte	49
	.byte	-79
	.byte	18
	.byte	16
	.byte	89
	.byte	39
	.byte	-128
	.byte	-20
	.byte	95
	.byte	96
	.byte	81
	.byte	127
	.byte	-87
	.byte	25
	.byte	-75
	.byte	74
	.byte	13
	.byte	45
	.byte	-27
	.byte	122
	.byte	-97
	.byte	-109
	.byte	-55
	.byte	-100
	.byte	-17
	.byte	-96
	.byte	-32
	.byte	59
	.byte	77
	.byte	-82
	.byte	42
	.byte	-11
	.byte	-80
	.byte	-56
	.byte	-21
	.byte	-69
	.byte	60
	.byte	-125
	.byte	83
	.byte	-103
	.byte	97
	.byte	23
	.byte	43
	.byte	4
	.byte	126
	.byte	-70
	.byte	119
	.byte	-42
	.byte	38
	.byte	-31
	.byte	105
	.byte	20
	.byte	99
	.byte	85
	.byte	33
	.byte	12
	.byte	125

	.text
	.globl	rj_xtime
	.ent	rj_xtime
rj_xtime:
	# vars= 0, regs= 0/0, args= 0, gp= 0
	move	$2,$4
	sb	$2,0($sp)
	lb	$2,0($sp)
	bgez	$2,$L7
	nop

	lbu	$2,0($sp)
	sll	$2,$2,1
	sll	$2,$2,24
	sra	$2,$2,24
	xori	$2,$2,0x1b
	sll	$2,$2,24
	sra	$2,$2,24
	andi	$2,$2,0x00ff
	b	$L8
	nop

$L7:
	lbu	$2,0($sp)
	sll	$2,$2,1
	andi	$2,$2,0x00ff
$L8:
	jr	$31
	nop

	.end	rj_xtime
	.globl	aes_subBytes
	.ent	aes_subBytes
aes_subBytes:
	# vars= 0, regs= 1/0, args= 0, gp= 0
	addiu	$sp,$sp,-8
	sw	$16,4($sp)
	sw	$4,8($sp)
	ori	$16, $0, 16			# 0x10
	b	$L11
	nop

$L12:
	move	$3,$16
	lw	$2,8($sp)
	addu	$2,$2,$3
	lbu	$2,0($2)
	move	$4,$2
	move	$3,$16
	lw	$2,8($sp)
	addu	$2,$2,$3
	lui	$3, 0x1001 #sbox
	addu	$3,$4,$3
	lbu	$3,0($3)
	sb	$3,0($2)
$L11:
	move	$2,$16
	addiu	$3,$2,-1
	andi	$16,$3,0x00ff
	bne	$2,$0,$L12
	nop

	nop
	lw	$16,4($sp)
	addiu	$sp,$sp,8
	jr	$31
	nop

	.end	aes_subByte
	.globl	aes_subBytes_inv
	.ent	aes_subBytes_inv
aes_subBytes_inv:
	# vars= 0, regs= 1/0, args= 0, gp= 0
	addiu	$sp,$sp,-8
	sw	$16,4($sp)
	sw	$4,8($sp)
	ori	$16, $0, 16			# 0x10
	b	$L15
	nop

$L16:
	move	$3,$16
	lw	$2,8($sp)
	addu	$2,$2,$3
	lbu	$2,0($2)
	move	$4,$2
	move	$3,$16
	lw	$2,8($sp)
	addu	$2,$2,$3
	lui	$3, 0x1001 #sboxinv
	ori     $3, $3, 256 
	addu	$3,$4,$3
	lbu	$3,0($3)
	sb	$3,0($2)
$L15:
	move	$2,$16
	addiu	$3,$2,-1
	andi	$16,$3,0x00ff
	bne	$2,$0,$L16
	nop

	nop
	lw	$16,4($sp)
	addiu	$sp,$sp,8
	jr	$31
	nop

	.end	aes_subBytes_inv
	.globl	aes_addRoundKey
	.ent	aes_addRoundKey
aes_addRoundKey:
	# vars= 8, regs= 1/0, args= 0, gp= 0
	addiu	$sp,$sp,-16
	sw	$16,12($sp)
	sw	$4,16($sp)
	sw	$5,20($sp)
	ori	$16, $0, 16			# 0x10
	b	$L19
	nop

$L20:
	move	$3,$16
	lw	$2,16($sp)
	addu	$2,$2,$3
	lbu	$4,0($2)
	move	$3,$16
	lw	$2,20($sp)
	addu	$2,$2,$3
	lbu	$3,0($2)
	move	$5,$16
	lw	$2,16($sp)
	addu	$2,$2,$5
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
$L19:
	move	$2,$16
	addiu	$3,$2,-1
	andi	$16,$3,0x00ff
	bne	$2,$0,$L20
	nop

	ori	$2, $0, 1			# 0x1
	sw	$2,0($sp)
	nop
	lw	$16,12($sp)
	addiu	$sp,$sp,16
	jr	$31
	nop

	.end	aes_addRoundKey
	.globl	aes_addRoundKey_cpy
	.ent	aes_addRoundKey_cpy

aes_addRoundKey_cpy:
	# vars= 0, regs= 1/0, args= 0, gp= 0
	addiu	$sp,$sp,-8
	sw	$16,4($sp)
	sw	$4,8($sp)
	sw	$5,12($sp)
	sw	$6,16($sp)
	ori	$16,$0, 16			# 0x10
	b	$L22
	nop

$L23:
	move	$3,$16
	lw	$2,8($sp)
	addu	$2,$2,$3
	lbu	$4,0($2)
	move	$3,$16
	lw	$2,12($sp)
	addu	$2,$2,$3
	lbu	$3,0($2)
	move	$5,$16
	lw	$2,8($sp)
	addu	$2,$2,$5
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	move	$3,$16
	lw	$2,12($sp)
	addu	$3,$2,$3
	move	$4,$16
	lw	$2,16($sp)
	addu	$2,$2,$4
	lbu	$3,0($3)
	sb	$3,0($2)
	move	$2,$16
	addiu	$2,$2,16
	move	$3,$2
	lw	$2,12($sp)
	addu	$3,$2,$3
	move	$2,$16
	addiu	$2,$2,16
	move	$4,$2
	lw	$2,16($sp)
	addu	$2,$2,$4
	lbu	$3,0($3)
	sb	$3,0($2)
$L22:
	move	$2,$16
	addiu	$3,$2,-1
	andi	$16,$3,0x00ff
	bne	$2,$0,$L23
	nop

	nop
	lw	$16,4($sp)
	addiu	$sp,$sp,8
	jr	$31
	nop

	.end	aes_addRoundKey_cpy

	.globl	aes_shiftRows
	.ent	aes_shiftRows
aes_shiftRows:
	# vars= 0, regs= 1/0, args= 0, gp= 0
	addiu	$sp,$sp,-8
	sw	$16,4($sp)
	sw	$4,8($sp)
	lw	$2,8($sp)
	lbu	$16,1($2)
	lw	$2,8($sp)
	addiu	$2,$2,1
	lw	$3,8($sp)
	lbu	$3,5($3)
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,5
	lw	$3,8($sp)
	lbu	$3,9($3)
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,9
	lw	$3,8($sp)
	lbu	$3,13($3)
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,13
	sb	$16,0($2)
	lw	$2,8($sp)
	lbu	$16,10($2)
	lw	$2,8($sp)
	addiu	$2,$2,10
	lw	$3,8($sp)
	lbu	$3,2($3)
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,2
	sb	$16,0($2)
	lw	$2,8($sp)
	lbu	$16,3($2)
	lw	$2,8($sp)
	addiu	$2,$2,3
	lw	$3,8($sp)
	lbu	$3,15($3)
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,15
	lw	$3,8($sp)
	lbu	$3,11($3)
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,11
	lw	$3,8($sp)
	lbu	$3,7($3)
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,7
	sb	$16,0($2)
	lw	$2,8($sp)
	lbu	$16,14($2)
	lw	$2,8($sp)
	addiu	$2,$2,14
	lw	$3,8($sp)
	lbu	$3,6($3)
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,6
	sb	$16,0($2)
	nop
	lw	$16,4($sp)
	addiu	$sp,$sp,8
	jr	$31
	nop

	.end	aes_shiftRows
	.globl	aes_shiftRows_inv
	.ent	aes_shiftRows_inv
aes_shiftRows_inv:
	# vars= 0, regs= 1/0, args= 0, gp= 0
	addiu	$sp,$sp,-8
	sw	$16,4($sp)
	sw	$4,8($sp)
	lw	$2,8($sp)
	lbu	$16,1($2)
	lw	$2,8($sp)
	addiu	$2,$2,1
	lw	$3,8($sp)
	lbu	$3,13($3)
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,13
	lw	$3,8($sp)
	lbu	$3,9($3)
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,9
	lw	$3,8($sp)
	lbu	$3,5($3)
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,5
	sb	$16,0($2)
	lw	$2,8($sp)
	lbu	$16,2($2)
	lw	$2,8($sp)
	addiu	$2,$2,2
	lw	$3,8($sp)
	lbu	$3,10($3)
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,10
	sb	$16,0($2)
	lw	$2,8($sp)
	lbu	$16,3($2)
	lw	$2,8($sp)
	addiu	$2,$2,3
	lw	$3,8($sp)
	lbu	$3,7($3)
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,7
	lw	$3,8($sp)
	lbu	$3,11($3)
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,11
	lw	$3,8($sp)
	lbu	$3,15($3)
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,15
	sb	$16,0($2)
	lw	$2,8($sp)
	lbu	$16,6($2)
	lw	$2,8($sp)
	addiu	$2,$2,6
	lw	$3,8($sp)
	lbu	$3,14($3)
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,14
	sb	$16,0($2)
	nop
	lw	$16,4($sp)
	addiu	$sp,$sp,8
	jr	$31
	nop

	.end	aes_shiftRows_inv
	.globl	aes_mixColumns
	.ent	aes_mixColumns
aes_mixColumns:
	# vars= 0, regs= 7/0, args= 16, gp= 0
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$21,40($sp)
	sw	$20,36($sp)
	sw	$19,32($sp)
	sw	$18,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	sw	$4,48($sp)
	move	$16,$0
	b	$L30
	nop

$L31:
	move	$3,$16
	lw	$2,48($sp)
	addu	$2,$2,$3
	lbu	$18,0($2)
	move	$2,$16
	addiu	$2,$2,1
	lw	$3,48($sp)
	addu	$2,$3,$2
	lbu	$21,0($2)
	move	$2,$16
	addiu	$2,$2,2
	lw	$3,48($sp)
	addu	$2,$3,$2
	lbu	$20,0($2)
	move	$2,$16
	addiu	$2,$2,3
	lw	$3,48($sp)
	addu	$2,$3,$2
	lbu	$19,0($2)
	xor	$2,$18,$21
	andi	$2,$2,0x00ff
	xor	$2,$20,$2
	andi	$2,$2,0x00ff
	xor	$2,$19,$2
	andi	$17,$2,0x00ff
	xor	$2,$18,$21
	andi	$2,$2,0x00ff
	move	$4,$2
	jal	rj_xtime
	nop

	xor	$2,$17,$2
	andi	$2,$2,0x00ff
	move	$4,$2
	move	$3,$16
	lw	$2,48($sp)
	addu	$2,$2,$3
	lbu	$2,0($2)
	sll	$3,$2,24
	sra	$3,$3,24
	sll	$2,$4,24
	sra	$2,$2,24
	xor	$2,$3,$2
	sll	$3,$2,24
	sra	$3,$3,24
	move	$4,$16
	lw	$2,48($sp)
	addu	$2,$2,$4
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	xor	$2,$21,$20
	andi	$2,$2,0x00ff
	move	$4,$2
	jal	rj_xtime
	nop

	xor	$2,$17,$2
	andi	$2,$2,0x00ff
	move	$4,$2
	move	$2,$16
	addiu	$2,$2,1
	lw	$3,48($sp)
	addu	$2,$3,$2
	lbu	$2,0($2)
	sll	$3,$2,24
	sra	$3,$3,24
	sll	$2,$4,24
	sra	$2,$2,24
	xor	$2,$3,$2
	sll	$4,$2,24
	sra	$4,$4,24
	move	$2,$16
	addiu	$2,$2,1
	lw	$3,48($sp)
	addu	$2,$3,$2
	andi	$3,$4,0x00ff
	sb	$3,0($2)
	xor	$2,$20,$19
	andi	$2,$2,0x00ff
	move	$4,$2
	jal	rj_xtime
	nop

	xor	$2,$17,$2
	andi	$2,$2,0x00ff
	move	$4,$2
	move	$2,$16
	addiu	$2,$2,2
	lw	$3,48($sp)
	addu	$2,$3,$2
	lbu	$2,0($2)
	sll	$3,$2,24
	sra	$3,$3,24
	sll	$2,$4,24
	sra	$2,$2,24
	xor	$2,$3,$2
	sll	$4,$2,24
	sra	$4,$4,24
	move	$2,$16
	addiu	$2,$2,2
	lw	$3,48($sp)
	addu	$2,$3,$2
	andi	$3,$4,0x00ff
	sb	$3,0($2)
	xor	$2,$19,$18
	andi	$2,$2,0x00ff
	move	$4,$2
	jal	rj_xtime
	nop

	xor	$2,$17,$2
	andi	$2,$2,0x00ff
	move	$4,$2
	move	$2,$16
	addiu	$2,$2,3
	lw	$3,48($sp)
	addu	$2,$3,$2
	lbu	$2,0($2)
	sll	$3,$2,24
	sra	$3,$3,24
	sll	$2,$4,24
	sra	$2,$2,24
	xor	$2,$3,$2
	sll	$4,$2,24
	sra	$4,$4,24
	move	$2,$16
	addiu	$2,$2,3
	lw	$3,48($sp)
	addu	$2,$3,$2
	andi	$3,$4,0x00ff
	sb	$3,0($2)
	addiu	$2,$16,4
	andi	$16,$2,0x00ff
$L30:
	sltiu	$2,$16,16
	bne	$2,$0,$L31
	nop

	nop
	lw	$31,44($sp)
	lw	$21,40($sp)
	lw	$20,36($sp)
	lw	$19,32($sp)
	lw	$18,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	addiu	$sp,$sp,48
	jr	$31
	nop

	.end	aes_mixColumns
	.globl	aes_mixColumns_inv
	.ent	aes_mixColumns_inv
aes_mixColumns_inv:
	# vars= 0, regs= 9/0, args= 16, gp= 0
	addiu	$sp,$sp,-56
	sw	$31,52($sp)
	sw	$23,48($sp)
	sw	$22,44($sp)
	sw	$21,40($sp)
	sw	$20,36($sp)
	sw	$19,32($sp)
	sw	$18,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	sw	$4,56($sp)
	move	$16,$0
	b	$L34
	nop

$L35:
	move	$3,$16
	lw	$2,56($sp)
	addu	$2,$2,$3
	lbu	$17,0($2)
	move	$2,$16
	addiu	$2,$2,1
	lw	$3,56($sp)
	addu	$2,$3,$2
	lbu	$20,0($2)
	move	$2,$16
	addiu	$2,$2,2
	lw	$3,56($sp)
	addu	$2,$3,$2
	lbu	$19,0($2)
	move	$2,$16
	addiu	$2,$2,3
	lw	$3,56($sp)
	addu	$2,$3,$2
	lbu	$18,0($2)
	xor	$2,$17,$20
	andi	$2,$2,0x00ff
	xor	$2,$19,$2
	andi	$2,$2,0x00ff
	xor	$2,$18,$2
	andi	$21,$2,0x00ff
	move	$4,$21
	jal	rj_xtime
	nop

	move	$23,$2
	xor	$2,$23,$17
	andi	$2,$2,0x00ff
	xor	$2,$19,$2
	andi	$2,$2,0x00ff
	move	$4,$2
	jal	rj_xtime
	nop

	move	$4,$2
	jal	rj_xtime
	nop

	xor	$2,$21,$2
	andi	$22,$2,0x00ff
	xor	$2,$23,$20
	andi	$2,$2,0x00ff
	xor	$2,$18,$2
	andi	$2,$2,0x00ff
	move	$4,$2
	jal	rj_xtime
	nop

	move	$4,$2
	jal	rj_xtime
	nop

	xor	$2,$21,$2
	andi	$21,$2,0x00ff
	xor	$2,$17,$20
	andi	$2,$2,0x00ff
	move	$4,$2
	jal	rj_xtime
	nop

	xor	$2,$22,$2
	andi	$2,$2,0x00ff
	move	$4,$2
	move	$3,$16
	lw	$2,56($sp)
	addu	$2,$2,$3
	lbu	$2,0($2)
	sll	$3,$2,24
	sra	$3,$3,24
	sll	$2,$4,24
	sra	$2,$2,24
	xor	$2,$3,$2
	sll	$3,$2,24
	sra	$3,$3,24
	move	$4,$16
	lw	$2,56($sp)
	addu	$2,$2,$4
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	xor	$2,$20,$19
	andi	$2,$2,0x00ff
	move	$4,$2
	jal	rj_xtime
	nop

	xor	$2,$21,$2
	andi	$2,$2,0x00ff
	move	$4,$2
	move	$2,$16
	addiu	$2,$2,1
	lw	$3,56($sp)
	addu	$2,$3,$2
	lbu	$2,0($2)
	sll	$3,$2,24
	sra	$3,$3,24
	sll	$2,$4,24
	sra	$2,$2,24
	xor	$2,$3,$2
	sll	$4,$2,24
	sra	$4,$4,24
	move	$2,$16
	addiu	$2,$2,1
	lw	$3,56($sp)
	addu	$2,$3,$2
	andi	$3,$4,0x00ff
	sb	$3,0($2)
	xor	$2,$19,$18
	andi	$2,$2,0x00ff
	move	$4,$2
	jal	rj_xtime
	nop

	xor	$2,$22,$2
	andi	$2,$2,0x00ff
	move	$4,$2
	move	$2,$16
	addiu	$2,$2,2
	lw	$3,56($sp)
	addu	$2,$3,$2
	lbu	$2,0($2)
	sll	$3,$2,24
	sra	$3,$3,24
	sll	$2,$4,24
	sra	$2,$2,24
	xor	$2,$3,$2
	sll	$4,$2,24
	sra	$4,$4,24
	move	$2,$16
	addiu	$2,$2,2
	lw	$3,56($sp)
	addu	$2,$3,$2
	andi	$3,$4,0x00ff
	sb	$3,0($2)
	xor	$2,$18,$17
	andi	$2,$2,0x00ff
	move	$4,$2
	jal	rj_xtime
	nop

	xor	$2,$21,$2
	andi	$2,$2,0x00ff
	move	$4,$2
	move	$2,$16
	addiu	$2,$2,3
	lw	$3,56($sp)
	addu	$2,$3,$2
	lbu	$2,0($2)
	sll	$3,$2,24
	sra	$3,$3,24
	sll	$2,$4,24
	sra	$2,$2,24
	xor	$2,$3,$2
	sll	$4,$2,24
	sra	$4,$4,24
	move	$2,$16
	addiu	$2,$2,3
	lw	$3,56($sp)
	addu	$2,$3,$2
	andi	$3,$4,0x00ff
	sb	$3,0($2)
	addiu	$2,$16,4
	andi	$16,$2,0x00ff
$L34:
	sltiu	$2,$16,16
	bne	$2,$0,$L35
	nop

	nop
	lw	$31,52($sp)
	lw	$23,48($sp)
	lw	$22,44($sp)
	lw	$21,40($sp)
	lw	$20,36($sp)
	lw	$19,32($sp)
	lw	$18,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	addiu	$sp,$sp,56
	jr	$31
	nop

	.end	aes_mixColumns_inv
	.globl	aes_expandEncKey
	.ent	aes_expandEncKey
aes_expandEncKey:
		# vars= 0, regs= 1/0, args= 0, gp= 0
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
	lw	$2,12($sp)
	lbu	$2,0($2)
	xor	$2,$4,$2
	andi	$2,$2,0x00ff
	xor	$2,$3,$2
	andi	$3,$2,0x00ff
	lw	$2,8($sp)
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,1
	lbu	$4,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,30
	lbu	$2,0($2)
	move	$3,$2
	lui	$2,0x1001 # sbox
	addu	$2,$3,$2
	lbu	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,1
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,2
	lbu	$4,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,31
	lbu	$2,0($2)
	move	$3,$2
	lui	$2,0x1001 # sbox
	addu	$2,$3,$2
	lbu	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,2
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,3
	lbu	$4,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,28
	lbu	$2,0($2)
	move	$3,$2
	lui	$2,0x1001 # sbox
	addu	$2,$3,$2
	lbu	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,3
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	lw	$2,12($sp)
	lbu	$2,0($2)
	sll	$2,$2,1
	sll	$4,$2,24
	sra	$4,$4,24
	lw	$2,12($sp)
	lbu	$2,0($2)
	srl	$2,$2,7
	andi	$2,$2,0x00ff
	move	$3,$2
	sll	$3,$3,3
	subu	$3,$3,$2
	sll	$3,$3,2
	subu	$2,$3,$2
	andi	$2,$2,0x00ff
	sll	$2,$2,24
	sra	$2,$2,24
	xor	$2,$4,$2
	sll	$2,$2,24
	sra	$2,$2,24
	andi	$3,$2,0x00ff
	lw	$2,12($sp)
	sb	$3,0($2)
	ori	$16, $0, 4			# 0x4
	b	$L38
	nop

$L39:
	move	$3,$16
	lw	$2,8($sp)
	addu	$2,$2,$3
	lbu	$4,0($2)
	move	$2,$16
	addiu	$2,$2,-4
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$3,0($2)
	move	$5,$16
	lw	$2,8($sp)
	addu	$2,$2,$5
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	move	$2,$16
	addiu	$2,$2,1
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$4,0($2)
	move	$2,$16
	addiu	$2,$2,-3
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$3,0($2)
	move	$2,$16
	addiu	$2,$2,1
	lw	$5,8($sp)
	addu	$2,$5,$2
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	move	$2,$16
	addiu	$2,$2,2
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$4,0($2)
	move	$2,$16
	addiu	$2,$2,-2
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$3,0($2)
	move	$2,$16
	addiu	$2,$2,2
	lw	$5,8($sp)
	addu	$2,$5,$2
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	move	$2,$16
	addiu	$2,$2,3
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$4,0($2)
	move	$2,$16
	addiu	$2,$2,-1
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$3,0($2)
	move	$2,$16
	addiu	$2,$2,3
	lw	$5,8($sp)
	addu	$2,$5,$2
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	addiu	$2,$16,4
	andi	$16,$2,0x00ff
$L38:
	sltiu	$2,$16,16
	bne	$2,$0,$L39
	nop

	lw	$2,8($sp)
	addiu	$2,$2,16
	lbu	$4,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,12
	lbu	$2,0($2)
	move	$3,$2
	lui	$2,0x1001 # sbox
	addu	$2,$3,$2
	lbu	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,16
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,17
	lbu	$4,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,13
	lbu	$2,0($2)
	move	$3,$2
	lui	$2,0x1001 # sbox
	addu	$2,$3,$2
	lbu	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,17
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,18
	lbu	$4,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,14
	lbu	$2,0($2)
	move	$3,$2
	lui	$2,0x1001 # sbox
	addu	$2,$3,$2
	lbu	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,18
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,19
	lbu	$4,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,15
	lbu	$2,0($2)
	move	$3,$2
	lui	$2,0x1001 # sbox
	addu	$2,$3,$2
	lbu	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,19
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	ori	$16,$0,20			# 0x14
	b	$L40
	nop

$L41:
	move	$3,$16
	lw	$2,8($sp)
	addu	$2,$2,$3
	lbu	$4,0($2)
	move	$2,$16
	addiu	$2,$2,-4
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$3,0($2)
	move	$5,$16
	lw	$2,8($sp)
	addu	$2,$2,$5
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	move	$2,$16
	addiu	$2,$2,1
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$4,0($2)
	move	$2,$16
	addiu	$2,$2,-3
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$3,0($2)
	move	$2,$16
	addiu	$2,$2,1
	lw	$5,8($sp)
	addu	$2,$5,$2
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	move	$2,$16
	addiu	$2,$2,2
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$4,0($2)
	move	$2,$16
	addiu	$2,$2,-2
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$3,0($2)
	move	$2,$16
	addiu	$2,$2,2
	lw	$5,8($sp)
	addu	$2,$5,$2
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	move	$2,$16
	addiu	$2,$2,3
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$4,0($2)
	move	$2,$16
	addiu	$2,$2,-1
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$3,0($2)
	move	$2,$16
	addiu	$2,$2,3
	lw	$5,8($sp)
	addu	$2,$5,$2
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	addiu	$2,$16,4
	andi	$16,$2,0x00ff
$L40:
	sltiu	$2,$16,32
	bne	$2,$0,$L41
	nop

	nop
	lw	$16,4($sp)
	addiu	$sp,$sp,8
	jr	$31
	nop

	.end	aes_expandEncKey
	.globl	aes_expandDecKey
	.ent	aes_expandDecKey
aes_expandDecKey:
	# vars= 8, regs= 0/0, args= 0, gp= 0
	addiu	$sp,$sp,-8
	sw	$4,8($sp)
	sw	$5,12($sp)
	ori	$2, $0, 28			# 0x1c
	sb	$2,0($sp)
	b	$L44
	nop

$L45:
	lbu	$2,0($sp)
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$4,0($2)
	lbu	$2,0($sp)
	addiu	$2,$2,-4
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$3,0($2)
	lbu	$2,0($sp)
	lw	$5,8($sp)
	addu	$2,$5,$2
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	lbu	$2,0($sp)
	addiu	$2,$2,1
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$4,0($2)
	lbu	$2,0($sp)
	addiu	$2,$2,-3
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$3,0($2)
	lbu	$2,0($sp)
	addiu	$2,$2,1
	lw	$5,8($sp)
	addu	$2,$5,$2
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	lbu	$2,0($sp)
	addiu	$2,$2,2
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$4,0($2)
	lbu	$2,0($sp)
	addiu	$2,$2,-2
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$3,0($2)
	lbu	$2,0($sp)
	addiu	$2,$2,2
	lw	$5,8($sp)
	addu	$2,$5,$2
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	lbu	$2,0($sp)
	addiu	$2,$2,3
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$4,0($2)
	lbu	$2,0($sp)
	addiu	$2,$2,-1
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$3,0($2)
	lbu	$2,0($sp)
	addiu	$2,$2,3
	lw	$5,8($sp)
	addu	$2,$5,$2
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	lbu	$2,0($sp)
	addiu	$2,$2,-4
	sb	$2,0($sp)
$L44:
	lbu	$2,0($sp)
	sltiu	$2,$2,17
	beq	$2,$0,$L45
	nop

	lw	$2,8($sp)
	addiu	$2,$2,16
	lbu	$4,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,12
	lbu	$2,0($2)
	move	$3,$2
	lui	$2,0x1001 # sbox
	addu	$2,$3,$2
	lbu	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,16
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,17
	lbu	$4,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,13
	lbu	$2,0($2)
	move	$3,$2
	lui	$2,0x1001 # sbox
	addu	$2,$3,$2
	lbu	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,17
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,18
	lbu	$4,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,14
	lbu	$2,0($2)
	move	$3,$2
	lui	$2,0x1001 # sbox
	addu	$2,$3,$2
	lbu	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,18
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,19
	lbu	$4,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,15
	lbu	$2,0($2)
	move	$3,$2
	lui	$2,0x1001 # sbox
	addu	$2,$3,$2
	lbu	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,19
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	ori	$2,$0,12			# 0xc
	sb	$2,0($sp)
	b	$L46
	nop

$L47:
	lbu	$2,0($sp)
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$4,0($2)
	lbu	$2,0($sp)
	addiu	$2,$2,-4
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$3,0($2)
	lbu	$2,0($sp)
	lw	$5,8($sp)
	addu	$2,$5,$2
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	lbu	$2,0($sp)
	addiu	$2,$2,1
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$4,0($2)
	lbu	$2,0($sp)
	addiu	$2,$2,-3
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$3,0($2)
	lbu	$2,0($sp)
	addiu	$2,$2,1
	lw	$5,8($sp)
	addu	$2,$5,$2
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	lbu	$2,0($sp)
	addiu	$2,$2,2
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$4,0($2)
	lbu	$2,0($sp)
	addiu	$2,$2,-2
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$3,0($2)
	lbu	$2,0($sp)
	addiu	$2,$2,2
	lw	$5,8($sp)
	addu	$2,$5,$2
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	lbu	$2,0($sp)
	addiu	$2,$2,3
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$4,0($2)
	lbu	$2,0($sp)
	addiu	$2,$2,-1
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$3,0($2)
	lbu	$2,0($sp)
	addiu	$2,$2,3
	lw	$5,8($sp)
	addu	$2,$5,$2
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	lbu	$2,0($sp)
	addiu	$2,$2,-4
	sb	$2,0($sp)
$L46:
	lbu	$2,0($sp)
	bne	$2,$0,$L47
	nop

	lw	$2,12($sp)
	lbu	$2,0($2)
	srl	$2,$2,1
	andi	$2,$2,0x00ff
	sll	$2,$2,24
	sra	$2,$2,24
	lw	$3,12($sp)
	lbu	$3,0($3)
	andi	$3,$3,0x1
	beq	$3,$0,$L48
	nop

	addi	$3,$0,-115			# 0xffffffffffffff8d
	b	$L49
	nop

$L48:
	move	$3,$0
$L49:
	xor	$2,$3,$2
	sll	$2,$2,24
	sra	$2,$2,24
	andi	$3,$2,0x00ff
	lw	$2,12($sp)
	sb	$3,0($2)
	lw	$2,8($sp)
	lbu	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,29
	lbu	$2,0($2)
	move	$4,$2
	lui	$2,0x1001 # sbox
	addu	$2,$4,$2
	lbu	$4,0($2)
	lw	$2,12($sp)
	lbu	$2,0($2)
	xor	$2,$4,$2
	andi	$2,$2,0x00ff
	xor	$2,$3,$2
	andi	$3,$2,0x00ff
	lw	$2,8($sp)
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,1
	lbu	$4,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,30
	lbu	$2,0($2)
	move	$3,$2
	lui	$2,0x1001 # sbox
	addu	$2,$3,$2
	lbu	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,1
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,2
	lbu	$4,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,31
	lbu	$2,0($2)
	move	$3,$2
	lui	$2,0x1001 # sbox
	addu	$2,$3,$2
	lbu	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,2
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,3
	lbu	$4,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,28
	lbu	$2,0($2)
	move	$3,$2
	lui	$2,0x1001 # sbox
	addu	$2,$3,$2
	lbu	$3,0($2)
	lw	$2,8($sp)
	addiu	$2,$2,3
	xor	$3,$4,$3
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	nop
	addiu	$sp,$sp,8
	jr	$31
	nop

	.end	aes_expandDecKey
	.globl	aes256_init
	.ent	aes256_init
aes256_init:
		# vars= 8, regs= 2/0, args= 16, gp= 0
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$16,24($sp)
	sw	$4,32($sp)
	sw	$5,36($sp)
	ori	$2, $0, 1			# 0x1
	sb	$2,16($sp)
	move	$16,$0
	b	$L52
	nop

$L53:
	move	$3,$16
	lw	$2,36($sp)
	addu	$3,$2,$3
	move	$2,$16
	lbu	$4,0($3)
	lw	$3,32($sp)
	addu	$3,$3,$2
	sb	$4,64($3)
	move	$4,$16
	lw	$3,32($sp)
	addu	$2,$3,$2
	lbu	$3,64($2)
	lw	$2,32($sp)
	addu	$2,$2,$4
	sb	$3,32($2)
	move	$2,$16
	addiu	$2,$2,1
	andi	$16,$2,0x00ff
$L52:
	sltiu	$2,$16,32
	bne	$2,$0,$L53
	nop

	ori	$16,$0,8			# 0x8
	b	$L54
	nop

$L55:
	lw	$2,32($sp)
	addiu	$2,$2,64
	addiu	$3,$sp,16
	move	$5,$3
	move	$4,$2
	jal	aes_expandEncKey
	nop

$L54:
	addiu	$2,$16,-1
	andi	$16,$2,0x00ff
	bne	$16,$0,$L55
	nop

	nop
	lw	$31,28($sp)
	lw	$16,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.end	aes256_init
	.globl	aes256_done
	.ent	aes256_done
aes256_done:
	# vars= 0, regs= 1/0, args= 0, gp= 0
	addiu	$sp,$sp,-8
	sw	$16,4($sp)
	sw	$4,8($sp)
	move	$16,$0
	b	$L58
	nop

$L59:
	move	$3,$16
	lw	$2,8($sp)
	addu	$2,$2,$3
	sb	$0,64($2)
	move	$2,$16
	lw	$4,8($sp)
	addu	$3,$4,$3
	lbu	$4,64($3)
	lw	$3,8($sp)
	addu	$3,$3,$2
	sb	$4,32($3)
	move	$4,$16
	lw	$3,8($sp)
	addu	$2,$3,$2
	lbu	$3,32($2)
	lw	$2,8($sp)
	addu	$2,$2,$4
	sb	$3,0($2)
	move	$2,$16
	addiu	$2,$2,1
	andi	$16,$2,0x00ff
$L58:
	sltiu	$2,$16,32
	bne	$2,$0,$L59
	nop

	nop
	lw	$16,4($sp)
	addiu	$sp,$sp,8
	jr	$31
	nop


	.end	aes256_done
	.globl	aes256_encrypt_ecb
	.ent	aes256_encrypt_ecb
aes256_encrypt_ecb:
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$4,32($sp)
	sw	$5,36($sp)
	lw	$2,32($sp)
	addiu	$2,$2,32
	lw	$3,32($sp)
	move	$6,$3
	move	$5,$2
	lw	$4,36($sp)
	jal	aes_addRoundKey_cpy
	nop

	ori	$2, $0, 1			# 0x1
	sb	$2,16($sp)
	ori	$2, $0, 1			# 0x1
	sb	$2,17($sp)
	b	$L62
	nop

$L65:
	lw	$4,36($sp)
	jal	aes_subBytes
	nop

	lw	$4,36($sp)
	jal	aes_shiftRows
	nop

	lw	$4,36($sp)
	jal	aes_mixColumns
	nop

	lbu	$2,16($sp)
	andi	$2,$2,0x1
	beq	$2,$0,$L63
	nop

	lw	$2,32($sp)
	addiu	$2,$2,16
	move	$5,$2
	lw	$4,36($sp)
	jal	aes_addRoundKey
	nop

	b	$L64
	nop

$L63:
	lw	$2,32($sp)
	addiu	$3,$sp,17
	move	$5,$3
	move	$4,$2
	jal	aes_expandEncKey
	nop

	lw	$2,32($sp)
	move	$5,$2
	lw	$4,36($sp)
	jal	aes_addRoundKey
	nop

$L64:
	lbu	$2,16($sp)
	addiu	$2,$2,1
	sb	$2,16($sp)
$L62:
	lbu	$2,16($sp)
	sltiu	$2,$2,14
	bne	$2,$0,$L65
	nop

	lw	$4,36($sp)
	jal	aes_subBytes
	nop

	lw	$4,36($sp)
	jal	aes_shiftRows
	nop

	lw	$2,32($sp)
	addiu	$3,$sp,17
	move	$5,$3
	move	$4,$2
	jal	aes_expandEncKey
	nop

	lw	$2,32($sp)
	move	$5,$2
	lw	$4,36($sp)
	jal	aes_addRoundKey
	nop

	nop
	lw	$31,28($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop


	.end	aes256_encrypt_ecb
	.globl	aes256_decrypt_ecb
	.ent	aes256_decrypt_ecb
aes256_decrypt_ecb:
	# vars= 8, regs= 1/0, args= 16, gp= 0
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$4,32($sp)
	sw	$5,36($sp)
	lw	$2,32($sp)
	addiu	$2,$2,64
	lw	$3,32($sp)
	move	$6,$3
	move	$5,$2
	lw	$4,36($sp)
	jal	aes_addRoundKey_cpy
	nop

	lw	$4,36($sp)
	jal	aes_shiftRows_inv
	nop

	lw	$4,36($sp)
	jal	aes_subBytes_inv
	nop

	ori	$2, $0, 14			# 0xe
	sb	$2,16($sp)
	addi	$2, $0, -128			# 0xffffffffffffff80
	sb	$2,17($sp)
	b	$L67
	nop

$L70:
	lbu	$2,16($sp)
	andi	$2,$2,0x1
	beq	$2,$0,$L68
	nop

	lw	$2,32($sp)
	addiu	$3,$sp,17
	move	$5,$3
	move	$4,$2
	jal	aes_expandDecKey
	nop

	lw	$2,32($sp)
	addiu	$2,$2,16
	move	$5,$2
	lw	$4,36($sp)
	jal	aes_addRoundKey
	nop

	b	$L69
	nop

$L68:
	lw	$2,32($sp)
	move	$5,$2
	lw	$4,36($sp)
	jal	aes_addRoundKey
	nop

$L69:
	lw	$4,36($sp)
	jal	aes_mixColumns_inv
	nop

	lw	$4,36($sp)
	jal	aes_shiftRows_inv
	nop

	lw	$4,36($sp)
	jal	aes_subBytes_inv
	nop

$L67:
	lbu	$2,16($sp)
	addiu	$2,$2,-1
	sb	$2,16($sp)
	lbu	$2,16($sp)
	bne	$2,$0,$L70
	nop

	lw	$2,32($sp)
	move	$5,$2
	lw	$4,36($sp)
	jal	aes_addRoundKey
	nop

	nop
	lw	$31,28($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.end	aes256_decrypt_ecb
	.globl	main
	.ent	main
main:
		# vars= 168, regs= 1/0, args= 16, gp= 0
	addiu	$sp,$sp,-192
	sw	$31,188($sp)
	sw	$4,192($sp)
	sw	$5,196($sp)
	sb	$0,16($sp)
	b	$L72
	nop

$L73:
	lbu	$4,16($sp)
	lbu	$3,16($sp)
	move	$2,$3
	sll	$2,$2,4
	addu	$2,$2,$3
	andi	$3,$2,0x00ff
	addiu	$2,$sp,16
	addu	$2,$2,$4
	sb	$3,132($2)
	lbu	$4,16($sp)
	lbu	$3,16($sp)
	move	$2,$3
	sll	$2,$2,4
	addu	$2,$2,$3
	andi	$3,$2,0x00ff
	addiu	$2,$sp,16
	addu	$2,$2,$4
	sb	$3,148($2)
	lbu	$2,16($sp)
	addiu	$2,$2,1
	sb	$2,16($sp)
$L72:
	lbu	$2,16($sp)
	sltiu	$2,$2,16
	bne	$2,$0,$L73
	nop

	sb	$0,16($sp)
	b	$L74
	nop

$L75:
	lbu	$2,16($sp)
	addiu	$3,$sp,16
	addu	$2,$3,$2
	lbu	$3,16($sp)
	sb	$3,100($2)
	lbu	$2,16($sp)
	addiu	$2,$2,1
	sb	$2,16($sp)
$L74:
	lbu	$2,16($sp)
	sltiu	$2,$2,32
	bne	$2,$0,$L75
	nop

	addiu	$3,$sp,116
	addiu	$2,$sp,20
	move	$5,$3
	move	$4,$2
	jal	aes256_init
	nop

	addiu	$3,$sp,148
	addiu	$2,$sp,20
	move	$5,$3
	move	$4,$2
	jal	aes256_encrypt_ecb
	nop

	addiu	$3,$sp,116
	addiu	$2,$sp,20
	move	$5,$3
	move	$4,$2
	jal	aes256_init
	nop

	addiu	$3,$sp,148
	addiu	$2,$sp,20
	move	$5,$3
	move	$4,$2
	jal	aes256_decrypt_ecb
	nop

	addiu	$2,$sp,20
	move	$4,$2
	jal	aes256_done
	nop

	addiu	$3,$sp,164
	addiu	$2,$sp,148
	ori	$6,$0,16			# 0x10
	move	$5,$3
	move	$4,$2
	jal	strncompare
	nop

	move	$4,$2
	ori     $2,$0,1
	syscall
	nop

	ori     $2, $0,10
	syscall
	nop
	
	move	$2,$0
	lw	$31,188($sp)
	addiu	$sp,$sp,192
	jr	$31
	nop

	.end	main
	.ident	"GCC: (GNU) 7.1.0"
