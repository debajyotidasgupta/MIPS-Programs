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


prep:
    move $a1, $a0
    sll $a1, $a1, 2
    addi $a1, $a1, 4
    sub $sp, $sp, $a1
    lw $zero, 0($sp)

fib:


print:    
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

Exit:
    li $v0, 10
    syscall

