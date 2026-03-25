# Autor: Diego Chávez Ríos
# Fecha: 25/03/2026
# dirFile

import shutil as s
import os
ficheros=[]
directorios=[]


f = open("rutas.txt", "r", encoding="utf-8")
lineas = f.readlines()          # lee todas las lineas
f.close()


for linea in lineas:            # itera por líneas (rutas), no por caracteres
   ruta = linea.strip()
   if not ruta:                # si no es una ruta continúa
       continue


   if os.path.isfile(ruta):
       ficheros.append(ruta)


   elif os.path.isdir(ruta):
       directorios.append(ruta)
while True:
   print("---  OPCIONES    ---")
   print("1. ELIMINAR FICHERO")
   print("2. MOSTRAR INFORMACIÓN DE UN DIRECTORIO")
   print("3. COPIAR FICHERO")
   print("4. MOSTRAR LISTA")
   print("5. SALIR")


   opcion = int(input("Introduzca una opción: "))


   match opcion:

       case 1:
           fich = input("Dime el nombre del fichero que quieres eliminar: ")
           if os.path.isfile(fich):
               if fich in ficheros:
                   ficheros.remove(fich)
                   print("Fichero eliminado con éxito.")
           else:
               print("No es un fichero.")

       case 2:
           carpeta = input("Dime el nombre del directorio: ")
           if os.path.isdir(carpeta):
               contenido = os.listdir(carpeta)
               print(contenido)

       case 3:
           fich = input("Dime el nombre del fichero: ")
           destino = input("Dime el destino: ")
           if os.path.isfile(fich):
               s.copy(fich,destino)
               print("Copiado con éxito.")
           else:
               print("No es un fichero o no existe.")

       case 4:
           lista = input("Dime qué lista quieres ver (ficheros) o (directorios): ")
           if lista == "ficheros":
               print(ficheros)
           elif lista == "directorios":
               print(directorios)
           else:
               print("Opción no válida.")

       case 5:
           print("Saliendo...")
           break

       case _:
           print("Opción no válida.")
