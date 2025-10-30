SET R0, 0X09 ;N (Cualquier Numero) 
SET R1, 0x00 ;Acumulador
SET R2, 0X00 ;CasoBase 0  
CMP R0, R2   ;Compara si N es igual al caso base(R2) -> se activa el flag Zero y termino el programa 
JZ terminar  ;Salto a terminar
MOV R1, R0   ;Muevo el numero N al acumulador  
siguiente:
DEC R0        ;Resto N -> N-1
ADD R1, R0    ;sumo N-1 en el acumulador(R1) -> N + (N-1)
CMP R0, R2    ;Comparo se N es igual a Cero
JZ terminar   ;Si R0(N) es igual a Cero(R1-CasoBase) termino la ejecución 
JMP siguiente ;Ejecuto de nuevo el programa 
terminar:     
JMP terminar 
