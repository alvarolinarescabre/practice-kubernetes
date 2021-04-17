#!/bin/bash

Help()
{
   # Display Help
   echo "Script para eliminar un cluster k8s."
   echo
   echo "Syntax: delete_cluster.sh [-n|-z|-h]"
   echo "options:"
   echo "n     Nombre del Cluster k8s"
   echo "z     Zona donde está el Cluster k8s"
   echo "h     Ayuda :D"
   echo
}

while getopts ":n:z:h" option; do
   case $option in
        n)
            NAME=${OPTARG}
            ;;
        z)
            ZONE=${OPTARG}
            ;;
        h)
            Help
            ;;
        :)
           echo "Error: Opción inválida. Opciones válidas: -n -z -h"
           ;;
   esac
done


if [ $NAME ] && [ $ZONE ]; then
        gcloud container clusters delete $NAME --zone $ZONE
else
	echo "Para más información utilice -h."
fi


