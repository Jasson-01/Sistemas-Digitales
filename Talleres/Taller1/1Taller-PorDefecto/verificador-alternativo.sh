#!/bin/sh

normalizar(){
    awk '/^[0-9 \t]+$/ { print $1 " "  $2 " "  $3 " "  $4 " "  $5 " "  $6 " "  $7 " "  $8  }' | sort
}

FILENAME="${1:?Uso: sh verificador.sh <fichero_logisim.circ>}"
logisim-evolution "${FILENAME}" -tty table --toplevel-circuit ALU | normalizar >resultados.txt
normalizar <expected.txt >expected_normalizado.txt
echo "Resultados guardados en resultados.txt"
echo "Se encontro que `diff -qs expected_normalizado.txt resultados.txt`."
   ( echo "A   \tB   \tOP\tN\tZ\tV\tC\tRES" > diff.txt && diff expected_normalizado.txt resultados.txt --color >> diff.txt;
   if [ $? -ne 0 ]
   then
	   echo "Revisa el archivo diff.txt para ver las diferencias con el resultado esperado."
   else
      echo "El Taller parece funcionar!"
   fi
   )
