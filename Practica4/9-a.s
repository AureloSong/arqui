            .data
cadena:     .asciiz "ArquiTectuRa de ComPutaDoras"
longitud:   .word   0            
            
            .code
                dadd        $t0, $zero, $zero
loop:           lbu         $t1, cadena($t0)
                beqz        $t1, fin
                daddi       $t0, $t0, 1
                j loop
fin:            sd  $t0, longitud($zero)
                HALT                