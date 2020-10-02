.data
newline:
    .asciiz "\n"
msg:
    .asciiz "Enter a number: "

    .text
    .globl main

main: 
    la $a0, msg
    li $v0, 4
    syscall

    li $v0, 5
    syscall
    move $a0, $v0
    li $a1, 0
    addi $sp, $sp, -4
    li $t0, 1
    sw $t0, 0($sp)
    jal fact

    move $a0, $v0
    li $v0, 1
    syscall

    la $a0, newline
    li $v0, 4
    syscall

    li $v0, 10
    syscall

fact:
    add $a1, $a1, 1
    addi $sp, $sp, -4
    lw $t0, 4($sp)
    mul $t0, $t0, $a1
    sw $t0, 0($sp)

    slt $t0, $a1, $a0
    bne $t0, $zero, fact
    lw $v0, 0($sp)
    jr $ra
