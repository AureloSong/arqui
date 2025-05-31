            .data
vector:     .word   1, -2, 3, -4, 5, -6, 7, -8, 9, -10
POS:        .word   0            
            .code
                dadd        $t0, $zero, $zero
                dadd        $t2, $zero, $zero
                daddi       $t3, $zero, 10
cont_p:         ld          $t1, vector($t2)
                slt         $t1, $t1, $zero
                BNEZ        $t1, es_neg
                daddi       $t0, $t0, 1
es_neg:         daddi       $t2, $t2, 8
                daddi       $t3, $t3, -1
                BNEZ        $t3, cont_p
                SD          $t0, POS($zero)
                HALT                