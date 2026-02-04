#!/bin/bash
# Autor: Diego Chavez
# Fecha: 04/02/2026
# Calculadora.sh

clear
echo "Autor: Diego Chavez"
echo "----Calculadora----"

# Comprobación de parámetros de entrada. Deben ser 2.
if [ $# -ne 2 ]; then
	echo "Error. Número de parámetros inválido."
	exit
fi

# Comprobación de que $1 no existe.
if [ -s $1 ]; then
	echo "El archivo existe."
	exit
fi

# Tan solo para adornar el fichero con las operaciones.
echo "Operaciones realizadas: " > $1

# Ejemplo de uso
echo "---SINTAXIS OPERACIONES---"
echo "---PARA SUMA: S ---"
echo "---PARA RESTA: R ---"
echo "---PARA MULTIPLICACION: M ---"
echo "---PARA DIVISION: D ---"
echo "---PARA SALIR: X ---"
echo
echo
# Bucle para que $2 se vaya actualizando con cada iteración.
for ((i=0;i<$2;i++)); do

	# Entrada de datos.
	read -p "Operacion Op1 Op2: " op op1 op2

# Menú.
	case $op in

		 "S")
			res=$(($op1 + $op2))
			echo $res
			echo "$op $op1 $op2" >> $1 
# Se guarda la operación en el archivo que pasamos como parámetro.
			echo
		;;

		 "R")
	                res=$(($op1 - $op2))
	                echo $res
			echo "$op $op1 $op2" >> $1
			echo
	        ;;

		 "M")
	                res=$(($op1 * $op2))
	                echo $res
			echo "$op $op1 $op2" >> $1
			echo
	        ;;

		 "D")
	                res=$(($op1 / $op2))
	                echo $res
			echo "$op $op1 $op2" >> $1
			echo
	        ;;

		 "X")
			echo "Saliendo..."
			break
        	;;

	 	"*")
			echo "Opción inválida"
			echo
        	;;

	esac

done

# Mostrar ruta completa del fichero $1 y su contenido.
pwd $1
cat $1
