#!/bin/bash

# Genera el script de generacion de todas las tablas con el orden adecuado. 
# Si no existe generarTodas.sql lo crea y si existe lo reescribe.

# Nos situamos en el directorio donde está este script (src/Admin)
cd "$(dirname "$0")" || exit

# Vaciamos o creamos el archivo destino desde cero
> generarTodas.sql

# Lista ordenada de entidades
entidades=(Articulo Proveedor Hotel Cliente Empleado Producir Suministrar Reservar Trabajar)

# Concatenamos cada archivo añadiendo un salto de línea al final
for entidad in "${entidades[@]}"; do
    echo "-- $entidad" >> generarTodas.sql
    cat "../$entidad/creacion.sql" >> generarTodas.sql
    echo "" >> generarTodas.sql
    echo "" >> generarTodas.sql
done

echo "Archivo generarTodas.sql generado correctamente."