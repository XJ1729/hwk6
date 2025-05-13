# print_array.asm program
# For CMPSC 64
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.data
	array:  .word 1 2 3 4 5 6 7 8 9 10  # Write the definition here
	cout:   .asciiz "The contents of the array are:\n" # Write the definition here
	newline: .asciiz "\n"

.text
printArr:
    # TODO: Write your function code here
	# for (int i = al-1; i >= 0; i--)
	# 	cout << a[i] << "\n";
	move $t0, $a1  # length of array
	addi $t0, $t0, -1  # last index of array
	move $t1, $a0 # base address of array
for:
	blt $t0, $zero, endloop
	sll $t2, $t0, 2 # word offset
	add $t2, $t2, $t1 # a[i]

	lw $a0, 0($t2)
	li $v0, 1
	syscall

	li $v0, 4
	la $a0, newline
	syscall

	addi $t0, $t0, -1
	j for

endloop:
	jr $ra


main:  # DO NOT MODIFY THE MAIN SECTION
	li $v0, 4
	la $a0, cout
	syscall

	la $a0, array
	li $a1, 10

	jal printArr

exit:
	# TODO: Write code to properly exit a SPIM simulation
	li $v0, 10
	syscall

