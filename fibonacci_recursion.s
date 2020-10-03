#============================
#   Code By : Little Angel  #
#============================
.data
newline:
    .asciiz "\n"
msg:
    .asciiz "Enter a number: "
output:
    .asciiz "Required Fib no.: "

    .text
    .globl main

main: 
    la $a0, msg
    li $v0, 4
    syscall

    li $v0, 5
    syscall
    move $a0, $v0
    jal fib

    move $s0, $v0
    la $a0, output
    li $v0, 4
    syscall

    move $a0, $s0
    li $v0, 1
    syscall

    la $a0, newline
    li $v0, 4
    syscall

    li $v0, 10
    syscall

fib:
    # base case
    slti $t0, $a0, 2
    bne $t0, $zero, EXIT

    addi $sp, $sp, -8
    # saving the current data
    sw $ra, 4($sp)

    addi $a0, $a0, -1
    jal fib
    addi $a0, $a0, 1
    sw $v0, 0($sp)
    addi $a0, $a0, -2
    jal fib
    addi $a0, $a0, 2
    lw $s0, 0($sp)
    add $v0, $v0, $s0

    # restoring the data
    lw $ra, 4($sp)
    addi $sp, $sp, 8
    jr $ra

EXIT:
    move $v0, $a0
    jr $ra