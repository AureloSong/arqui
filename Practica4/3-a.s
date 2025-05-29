        .data
ingreso: .asciiz    "Ingrese un numero mayor a 0."
CONTROL: .word      0x10000
DATA:    .word      0x10008
        .code
        ld          $t0, CONTROL($zero)
        ld          $t1, DATA($zero)    ;carga contro y data en registros.
        daddi       $t2, $zero, ingreso
        sd          $t2, 0($t1)
        daddi       $t2, $zero, 4
        sd          $t2, 0($t0)         
        daddi       $t2, $zero, 8       
        sd          $t2, 0($t0)
        ld          $t3, 0($t1)
        sd          $t2, 0($t0)
        ld          $t4, 0($t1)       
        dadd        $t4, $t3, $t4       ;sumo numeros
        sd          $t4, 0($t1)
        daddi       $t2, $zero, 2
        sd          $t2, 0($t0)         ;muestro res.
        HALT