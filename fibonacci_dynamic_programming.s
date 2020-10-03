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

    slti $t0, $a0, 2
    bne $t0, $zero, print
    jal prep


prep:
    move $a1, $a0
    sll $a1, $a1, 2
    addi $a1, $a1, 4
    # move $a0, $a1
    # j print
    sub $sp, $sp, $a1
    lw $zero, 0($sp)
    li $t0, 1
    sw $t0, 4($sp)
    li $a0, 8
    addi $sp, $sp, 8
    j fib

fib:
    move $s0, $a0
    lw $a0, -4($sp)
    slt $t0, $s0, $a1
    beq $t0, $zero, print

    move $a0, $s0
    lw $t0, -4($sp)
    lw $t1, -8($sp)
    add $t0, $t0, $t1
    sw $t0, 0($sp)
    addi $a0, $a0, 4
    addi $sp, $sp, 4
    j fib

print:    
    move $s0, $a0

    la $a0, output
    li $v0, 4
    syscall

    move $a0, $s0
    li $v0, 1
    syscall

    la $a0, newline
    li $v0, 4
    syscall

    j Exit

Exit:
    li $v0, 10
    syscall

