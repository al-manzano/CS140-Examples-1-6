.data
    valf:      .word 0
    valg:      .word 100
    valh:      .word 200
    vali:      .word 11

.text
.globl main

main:
    lw      $t1, valg
    lw      $t2, valh
    lw      $t3, vali

    slti $t0, $t3, 10
    beq $t0, $0, false

    add $t0, $t1, $t2
    j endif

false:
    sub $t0, $t1, $t2

endif:
    sw $t0, valf

    li $v0, 10
    syscall