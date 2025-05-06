.data
    sum:    .word 0
    A:      .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    vali:   .word 0

.text
.globl main

main:
    la $t0, A
    lw $t1, vali
    li $t2, 10
    lw $t3, sum

loop:
    slt $t4, $t1, $t2       # i < 10 ?
    blez $t4, endfor        # if so exit for loop

    sll $t4, $t1, 2         # offset
    add $t5, $t0, $t4       # memory address + offset
    lw $t6, 0($t5)          # loading value from array
    add $t3, $t3, $t6       # adding value to sum

    addi $t1, $t1, 1        # i++
    j loop
 
 endfor:
    sw $t3, sum
    li $v0, 10
    syscall

