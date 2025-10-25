SET R0, 0x09  ; Aqui mixeo entre 1001(9) y 0110(6) = 1111(15) 
SET R1, 0x06
MIX R0, R1 
halt:
JMP halt