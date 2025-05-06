.data
    vali:   .word 0
    A:      .word 1, 7, 3, 8, 5, 6, 8, 8, 9, 10
    k:      .word 7


.text
.globl main

main:
    la $t0, A
    lw $t1, vali
    lw $t3, k
    
loop:
    sll $t4, $t1, 2            # offset
    add $t2, $t0, $t4          # adding offset
    lw $t4, 0($t2)             # fetching offsetted value
    slt $t4, $t3, $t4          # A[i] <= k is NOT(A[i]>k)
    xori $t4, $t4, 1           # inverting (NOTing) A[i]>k

    blez $t4, endwhile         # condtion check
    addi $t1, $t1, 1           # i += 1
    j loop

# Bad practice; I used $t4 as a catch all register when I should have used other registers for better clarity

endwhile:
    sw $t1, vali
    li $v0, 10
    syscall

