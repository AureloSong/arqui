        .data
V:      .word 5, 2, 6        
        .code
            dadd $t0, $zero, $zero
            dadd $t2, $zero, $zero
            ld $t1, V($t0)
            dadd $t0, $t0, $t1
            daddi $t2, $t2, 8
            ld $t1, V($t2)
            dadd $t0, $t0, $t1
            daddi $t2, $t2, 8
            ld $t1, V($t2)
            dadd $t0, $t0, $t1
            halt