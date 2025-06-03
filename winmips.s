            .data 
CONTROL: .word 0x10000
DATA:    .word 0x10008 
msj:     .asciiz "Ingresa cada de caracteres: "
cad1:    .asciiz ""
cad2:    .asciiz ""

            .code
        ld $t6, CONTROL($zero)
        ld $t7, DATA($zero)
        daddi $t2, $zero, msj
        sd $t2, 0($t7)
        daddi $t2, $zero, 4
        sd $t2, 0($t6)
        ; mensaje impreso

        daddi $t3, $zero, cad1
        daddi $t2, $zero, 9

loop:   sd $t2, 0($t6)
        lbu $t4, 0($t7)
        beqz $t4, es_Zero
        sb $t5, 0($t3)
        daddi $t3, $t3, 1
        

es_Zero:
        
        halt