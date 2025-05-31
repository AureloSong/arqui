            .data
vector:     .word   1, -2, 3, -4, 5, -6, 7, -8, 9, -10
MAX:        .word   0            
            .code
                dadd        $t0, $zero, $zero
                dadd        $t2, $zero, $zero
                daddi       $t3, $zero, 10
                dadd        $t4, $zero, $zero
LOOP:           ld          $t1, vector($t2)
                slt         $t4, $t0, $t1
                BEQZ        $t4, no_es
                dadd        $t0, $zero, $t1
no_es:          daddi       $t2, $t2, 8
                daddi       $t3, $t3, -1
                BNEZ        $t3, LOOP
                SD          $t0, MAX($zero)
                HALT             