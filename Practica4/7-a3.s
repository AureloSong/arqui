            .data
vector:     .word   1, -2, 3, -4, 5, -6, 7, -8, 9, -10
MAX:        .word   0            
            .code
                dadd        $t0, $zero, $zero
                dadd        $t2, $zero, $zero
                daddi       $t3, $zero, 10
                dadd        $t4, $zero, $zero
LOOP:           ld          $t1, vector($t2)
                dsll        $t1, $t1, 1
                sd          $t1, vector($t2)
                daddi       $t2, $t2, 8
                daddi       $t3, $t3, -1
                bnez        $t3, LOOP
                HALT             