.text
add $t0, $t1, $t2
ori $t3, $t4, 0x55AA
lui $t5, 0x1122
ori $t5, $t5, 0x3344
sll $s1, $s2, 8
lw $s1, 8($s0)
addiu $s2, $s1, 5
sw $s2, 4($s0)
