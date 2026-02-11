#!/bin/bash
# Autor: Diego Chavez
# Fecha: 10/02/2026
# FiveOrMore

clear

function comprobar_errores (){
	# Número parámetros
	if [ $# -ne 2 ]; then
		echo "Error. Número de parámetros incorrecto. Deben ser 2."
		exit
	fi

	# Si el fichero existe ($1)
	if [ -s $1 ]; then
		echo "Error el fichero $1 existe."
		exit
	fi

	# Si el directorio no existe
	if [ ! -e $2 ]; then
		echo "El directorio $2 no existe."
		exit
	fi

	# Si el directorio está vacío
	dir=$(ls $2)
	if [ -z $dir ]; then
		echo "El directorio $dir está vacío."
		exit
	fi

}

# $1 Fichero de salida (no existe)
# $2 Directorio

comprobar_errores $1 $2
echo "---AUTOR: DIEGO CHAVEZ---"

ficheros=0
function extension(){
	for i in $2/*; do
		# Quedarse solo con el número de líneas del archivo.
		lineas=$(wc -l < "$i")
		# Si es .txt y número líneas >= 5, guarda en $1 y aumenta el número de ficheros que hay con 5 o más líneas.
		if [[ "$i" == *.txt && $lineas -ge 5 ]]; then
			echo "El fichero $i tiene 5 líneas o más."
			echo "$i" >> "$1"
			ficheros=$(($ficheros + 1))
			# Se crea el archivo idéntico con extensión .q y se vierte el contenido en la primera linea.
			echo "El fichero original tiene $(wc -w < $i) palabras." | cat - "$i" > temp.txt && mv temp.txt "$i.q"
			# - concatena el echo, lo vierte a un fichero temporal y mueve el contenido al nuevo archivo .q
			echo
		fi
	done
	# Saca el número total de ficheros que cumplen el requisito y se hace un tail -1 del archivo para leer el total de ficheros.
	echo "$ficheros" >> $1
	total=$(tail -1 $1)
	echo "Número total de ficheros: $total"
}

extension $1 $2


