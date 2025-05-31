        .data
V:      .word 5, 2, 6        
        .code
            dadd    $t0, $zero, $zero
            dadd    $t2, $zero, $zero
            daddi   $t3, $zero, 3
LOOP:       ld      $t1, V($t2)
            dadd    $t0, $t0, $t1
            daddi   $t2, $t2, 8
            daddi   $t3, $t3, -1
            BNEZ    $t3, LOOP
            halt
