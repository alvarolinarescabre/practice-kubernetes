#!/bin/bash

Help()
{
   # Display Help
   echo "Script para crear un almacenamiento Filestore en la región europe-west3."
   echo
   echo "Syntax: delete_filestore.sh [-p|-h]"
   echo "options:"
   echo "p     Proyecto de Google Cloud"
   echo "h     Ayuda :D"
   echo
}

while getopts ":p:n:h" option; do
   case $option in
        p)
            PROJECT=${OPTARG}
            ;;
        h)
            Help
            ;;
        :)
           echo "Error: Opción inválida. Opciones válidas: -p -h"
           ;;
   esac
done


if [ $PROJECT ]; then
	gcloud filestore instances delete nfs-server --project=$PROJECT --zone=europe-west3-c
else
	echo "Para más información utilice -h."
fi


