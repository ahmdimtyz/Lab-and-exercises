li $t0, 0
loop_start:
bge $t0, 5, loop_exit
add $t1, $t1, $t0
addi $t0, $t0, 1
j loop_start