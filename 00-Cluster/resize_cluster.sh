#!/bin/bash

Help()
{
   # Display Help
   echo "Script para agregar el doble de nodos a un cluster k8s en la región europe-west3."
   echo
   echo "Syntax: create_cluster.sh [-n|-h]"
   echo "options:"
   echo "n     Nombre del Cluster k8s"
   echo "h     Ayuda :D"
   echo
}

while getopts ":n:h" option; do
   case $option in
        n)
            NAME=${OPTARG}
            ;;
        h)
            Help
            ;;
        :)
           echo "Error: Opción inválida. Opciones válidas: -n -h"
           ;;
   esac
done


if [ $NAME ]; then
	gcloud container clusters resize $NAME --num-nodes=2 --region europe-west3
else
	echo "Para más información utilice -h."
fi

