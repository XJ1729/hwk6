# conversion.asm program
# For CMPSC 64
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
conv:
    # TODO: Write your function code here
    li $v0, 0 # z
    li $t0, 0 # i
    li $t1, 2 # for the if
for:
    bge $t0, $a2, endloop
    sll $t2, $a1, 2
    sub $v0, $v0, $a0
    add $v0, $v0, $t2
    blt $a0, $t1, endif
    sub $a1, $a1, $a0
endif:
    addi $a0, $a0, 1
    addi $t0, $t0, 1
    j for
endloop:
    jr $ra


main:  # DO NOT MODIFY THE MAIN SECTION
    li $a0, 5
    li $a1, 7

    jal conv

    move $a0, $v0
    li $v0, 1
    syscall

exit:
	# TODO: Write code to properly exit a SPIM simulation
    li $v0, 10
    syscall
