.data
    sum:    .word 0
    A:      .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    N:      .word 9
    step:   .word 2
    vali:   .word 0

.text
.globl main

main:
    la $t0, A
    lw $t1, sum
    lw $t2, N
    lw $t3, vali
    lw $t4, step

loop:
    sll $t8, $t3, 2         # offset calculation
    add $t7, $t0, $t8       # applying offset to address
    lw $t8, 0($t7)          # fetching value from offsetted address

    add $t1, $t1, $t8       # sum += A[i]
    add $t3, $t3, $t4       # 1 += step

    slt $t8, $t3, $t2       # i < N ?
    bgtz, $t8, loop         # loop conditional

    sw $t1, sum
    li $v0, 10
    syscall

