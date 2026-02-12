#!/bin/bash
# Autor: Diego Chavez
# Fecha: 12/02/2026
# Users.sh

clear

# Tomar como referencia 1000 si no se introduce un parámetro
if [ $# -eq 1 ]; then
	ref=$1
else
	ref=1000
fi
if [ $UID -ne 0 ]; then
	echo "No eres root."
	exit
fi

fecha=$(date +"%d-%m-%Y")
hora=$(date +"%H:%M")


echo "----------------------------------------"
echo
echo "Informe de usuarios el dia $fecha a las $hora"
echo

lineas=$(cat /etc/passwd)
contador=0
for l in $lineas; do
	u=$(echo $l | cut -d ":" -f 3)
	user=$(echo $l | cut -d ":" -f 1)
	if [ $u -ge $ref 2>/dev/null ]; then
		echo "$user - $u"
		contador=$(($contador + 1))
	fi
echo "$fecha - $hora - El usuario $USER ha solicitado un informe de usuarios" >> /tmp/logeventos
done

echo "Total: $contador usuarios"
echo
echo "---------------------------------------"
