        .data
coorX:      .byte   24
coorY:      .byte   24
color:      .byte   255,0,255,0 ; RGB 
CONTROL:    .word   0x10000
DATA:       .word   0x10008
        .code
    ld      $t0, CONTROL($zero)
    ld      $t1, DATA($zero)

    lbu     $t1, coorX($zero)
    sd      $t2, 5($t1)
    lbu     $t2, coorY($zero)
    sb      $t2, 4($t1)
    lwu     $t2, color($zero)
    sw      $t2, 0($t1)

    daddi   $t2, $zero, 5
    sd      $t2, 0($t0)
    HALT
    
