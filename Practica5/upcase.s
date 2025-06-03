.data
	cadena:     .asciiz "Caza"
    CONTROL:    .word32 0x10000
    DATA:       .word32 0x10008

.text
                    ; La pila comienza en el tope de la memoria de datos
                    DADDI   $sp, $zero, 0x400 
                    ; Guarda como primer argumento para upcaseStr
                    DADDI   $a0, $zero, cadena 
                    lwu     $s7, DATA($zero)
                    sd      $t0, 0($s7)
                    lwu     $s6, CONTROL($zero)
                    daddi   $t0, $zero, 4
                    sd      $t0, 0($s6)
                    
                    JAL upcaseStr

                    daddi   $t0, $zero, 4
                    sd      $t0, 0($s6)
                    HALT

; Parametros: - $a0 -> inicio de cadena
; Se utiliza la pila para guardar:
; - $ra -> porque se invoca a otra subrutina
; - $s0 -> para guardar la dirección de inicio de la cadena y recorrerla

upcaseStr: 		    DADDI $sp, $sp, -16 		    ; Reserva lugar en la pila -> 2 x 8
                    SD $ra, 0($sp)
                    SD $s0, 8($sp)
                    DADD $s0, $a0, $zero 	        ;copia la dirección de inicio de la cadena
upcaseStrLOOP: 	    LBU $a0, 0($s0) 			    ; recupera el car actual como argumento para upcase
                    BEQ $a0, $zero, upcaseStrFIN 	; Si es el fin de la cadena, termina
                    JAL upcase
                    SB $v0, 0($s0) 				    ; Guarda el caracter procesado en la cadena
                    DADDI $s0, $s0, 1 			    ; avanza al siguiente caracter
                    J upcaseStrLOOP
upcaseStrFIN: 		LD $ra, 0($sp)
                    LD $s0, 8($sp)
                    DADDI $sp, $sp, 16
                    JR $ra
; Pasar un caracter a mayúscula.
; Parámetros: - $a0 -> caracter
; - $v0 -> caracter en mayúscula
; No se utiliza la pila porque no se usan registros que deban ser salvados

upcase: 	        DADD $v0, $a0, $zero
                    SLTI $t0, $v0, 0x61 		    ; compara con ‘a’ minúscula
                    BNEZ $t0, salir 				; no es un caracter en minúscula
                    SLTI $t0, $v0, 0x7B 		    ; compara con el car sig a 'z' minúscula (z=7AH)
                    BEQZ $t0, salir 			    ; no es un caracter en minúscula
                    DADDI $v0, $v0, -0x20           ; pasa a minúscula (pone a ‘0’ el 6to bit)
salir: 		        JR $ra 					        ; retorna al programa principal