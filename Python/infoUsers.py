# Autor: Diego Chávez Ríos
# Fecha: 24/03/2026
# infoUsers

import os
import cpuinfo
if os.getuid() != 0:
    print("No eres root. Saliendo... \n")
    exit()

opcion=0

while True:
    print("---  MENÚ  ---")
    print("1. Mostrar información del SSOO e información de la CPU.")
    print("2. Información sobre un usuario.")
    print("3. Información sobre un directorio.")
    print("4. Salir del programa.")

    opcion = int(input("Seleciiona una opción: "))

    match opcion:
        case 1:
            print("\n---  INFORMACIÓN DEL SO  ---")
            info = os.uname()
            print("Sistema Operativo:", info.sysname)
            print("Versión:", info.release)
            print("\n---  INFORMACIÓN DE LA CPU   ---")
            cpu = cpuinfo.get_cpu_info()
            print("Modelo:", cpu.get("brand_raw"))
            print("Arquitectura:", cpu.get("arch"))
            print("Bits:", cpu.get("bits"))
            print("Frecuencia", cpu.get("hz_advertised_friendly"))

        case 2:
            usuario = input("Introduce un usuario: ")
            home = "/home" + usuario
            if os.path.exists(home):
                print("El usuario existe.")
                print(os.system("pwd"))
            else:
                print("El usuario no existe. Creándolo...")
                os.system(f"useradd -m {usuario}")
                print("Usuario creado.")
        case 3:
            directorio = input("Dime un directorio: ")

            if os.path.exists(directorio) and os.path.isdir(directorio):
                print("El directorio existe.")
            else:
                print("No existe o no es un directorio. Creándolo...")
                os.mkdir(directorio)
                print("Directorio creado.")
        case 4:
            print("Saliendo del programa...")
            exit()

        case _:
            print("Opción no válida.")