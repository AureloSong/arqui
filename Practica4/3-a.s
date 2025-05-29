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
        sd          $t2, 0($t0)         ;leo nro 1
        ld          $t2, $zero, 8       ;paso nro 1 a reg
        sd          $t2, 0($t0)         ;leo nro 2
        ld          $t4, 0($t1)         ;paso nro 2 a reg
        dadd        $t4, $t3, $t4       ;sumo numeros
        sd          $t4, 0($t1)
        daddi       $t2, $zero, 2
        sd          $t2, 0($t0)         ;muestro res.
        HALT