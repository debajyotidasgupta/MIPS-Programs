#============================
#   Code By : Little Angel  #
#============================
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
    # $a0 = 0, 1, 2 _____ N
    add $a1, $a1, 1         # increment the current value
    addi $sp, $sp, -4       # DP , store using memory, memoization
    lw $t0, 4($sp)          # load from memory
    mul $t0, $t0, $a1       # cur = i*a[i-1]
    sw $t0, 0($sp)          # store back in memory

    slt $t0, $a1, $a0
    bne $t0, $zero, fact
    lw $v0, 0($sp)
    jr $ra
