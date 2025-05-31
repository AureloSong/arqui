            .data
V:      .word   5, 2, 6
            .code
                dadd        $t0, $zero, $zero
                daddi       $t2, $zero, V
                daddi       $t3, $zero, 3
LOOP:           ld          $t1, 0($t2)
                dadd        $t0, $t0, $t1
                daddi       $t2, $t2, 8
                daddi       $t3, $t3, -1
                BNEZ        $t3, LOOP
                HALT