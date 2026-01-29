#!/bin/bash
# Autor: Diego Chavez
# Fecha: 29/01/2026
# Agenda

clear

while true; do

	echo "----- AGENDA -----"
	echo "a) Añadir una entrada."
	echo "b) Buscar por dni."
	echo "c) Ver la agenda completa."
	echo "d) Eliminar todas las entradas de la agenda."
	echo "e) Finalizar."
	echo "------------------"
	read -p "Introduce la acción que deseas realizar: " opt

	case $opt in
		a)
			read -p "Introduzca el DNI de la persona: " dni
				if  grep "$dni" agenda.txt 2>/dev/null ; then
					echo "La persona ya está dada de alta."
				else
					read -p "Introduzca el nombre de la persona: " nombre
		                        read -p "Introduzca los apellidos de la persona: " apellidos
                		        read -p "Introduzca la localidad de la persona: " localidad
                      			echo "$dni:$nombre:$apellidos:$localidad" >> agenda.txt
					echo "Añadido correctamente."
				fi
		;;
		b)
			read -p "Introduzca el DNI de la persona: " dni
				if [ ${#dni} == "9" ]; then
					echo "El dni es correcto"
					linea=$(grep "$dni" < agenda.txt)
					if [ -z "$linea" ]; then
						echo "No se encuentra el DNI introducido."
					else
						nombre=$(echo "$linea"  | cut -d ":" -f 2)
						apellidos=$(echo "$linea"  | cut -d ":" -f 3)
						localidad=$(echo "$linea"  | cut -d ":" -f 4)
						echo "La persona con DNI numero $dni es: $nombre $apellidos, y vive en $localidad. "

					fi

				else
					echo "El dni no es valido"
				fi
		;;

		c)
			if [ ! -s agenda.txt ]; then
				echo "Agenda vacía."
				exit
			else
				cat agenda.txt
			fi
		;;
		d)
			echo "Borrando contenido del archivo..."
				> agenda.txt 
			echo "Contenido borrado con éxito."
		;;
		e)
			echo "Saliendo..."
			break
		;;
		*)
			echo "Opción inválida."
		;;
	esac

done
