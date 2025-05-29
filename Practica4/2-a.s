.data 
texto:      .asciiz "Ingrese clave de 4 car"
permitir:   .asciiz "Clave correcta: acesso permitido"
denegar:    .asciiz "Clave incorrecta"
clave:      .asciiz "1234"
CONTROL:    .word   0x10000
DATA:       .word   0x10008
ingreso:    .asciiz ""


.code
            ld      $t0, CONTROL($zero)
            ld      $t1, DATA($zero)
            daddi   $t2, $zero, texto
            sd      $t2. 0($t1)
            daddi   $t2, $zero, 4
            sd      $t2, 0($t0)
            daddi   $t3, $zero, ingreso
            daddi   $t4, $zero, 9
LOOP:       sd      $t4, 0($t0)
            lbu     $t5, 0($t1)
            sb      $t5, 0($t3)
            daddi   $t3, $t3, 1
            daddi   $t2, $t2, -1
            bnez    $t2, LOOP
            daddi   $t2, $zero, 4
            daddi   $t3, $zero, clave
            daddi   $t4, $zero, ingreso
CHEQUEO:    lbu     $t5, 0($t3)
            bnez    $t5, $t6, NO           
            daddi   $t3, $t3, 1
            daddi   $t4, $t4, 1
            daddi   $t2, $t2, -1
            bnez    $t2, CHEQUEO
            daddi   $t2, $zero, permitir
            sd      $t2, 0($t1)
            j MOSTRAR
NO:         daddi   $t2, $zero, denegar
            sd      $t2, 0($t1)
MOSTRAR:    daddi   $t2, $zero, 4
            sd      $t2, 0($t0)
            HALT    