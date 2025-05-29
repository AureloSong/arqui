.data 
cant: 	.word   8 
datos: 	.word   1, 2, 3, 4, 5, 6, 7, 8 
res: 	.word   0 

.code 
        DADD R1, R0, R0 
        LD R2, cant(R0) 
LOOP:   LD R3, datos(R1) 
        DADDI R2, R2, -1 
        DSLL R3, R3, 1 
        SD R3, res(R1) 
        BNEZ R2, LOOP 
        DADDI R1, R1, 8  
        HALT 
