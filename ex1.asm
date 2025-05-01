.data
    valf:      .word 0
    valg:      .word 100
    valh:      .word 200
    vali:      .word 1
    valj:      .word 1

.text
.globl main

main:
    lw      $t0, valf
    lw      $t1, valg
    lw      $t2, valh
    lw      $t3, vali
    lw      $t4, valj

    bne     $t3, $t4, false
    add     $t0, $t1, $t2
    j endif

false:
    sub     $t0, $t1, $t2

endif:
    li $v0, 10
    syscall


    




