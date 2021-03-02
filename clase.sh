#!/bin/bash

echo "Esto es el inventario de Among Meme"
echo "==================================="

echo "¿Qué quieres hacer?"
echo "-------------------"

echo "1.- Mostrar Personajes"
echo "2.- Mostrar Inventario de un Personaje"
echo "3.- Salir" 

read INPUT

if [ "$INPUT" == "3" ] || [ "$INPUT" == "" ]; then
	echo "Pos hasta luego"
	exit 0
fi


if [ "$INPUT" == "1" ]; then

	echo "Personajes:"
	echo "select id_character,name from characters" | mysql -u consultas amongmeme

elif [ "$INPUT" == "2" ]; then
	
	echo "Inventario:"
	echo "==========="
	echo "¿De qué personaje quieres ver el inventario?"
	echo "--------------------------------------------"

	read INPUT

	if [ "$INPUT" == "" ]; then
		echo "Has de introducir algún valor"
		exit 1
	fi
	
	echo "select * from characters_items where id_character=$INPUT" | mysql -u consultas amongmeme | cut -d $'\t' -f 4

	mostrar personajes,mostrar items, insertar personaje, insertar item, relacionar personaje item
		
else

	echo "Opción Incorrecta!"

fi
