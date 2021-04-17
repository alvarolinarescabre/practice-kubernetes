#!/bin/bash

Help()
{
   # Display Help
   echo "Script para cambiar el número de nodos a un cluster k8s."
   echo
   echo "Syntax: resize_cluster.sh [-n|-i|-z|-h]"
   echo "options:"
   echo "n     Nombre del Cluster k8s"
   echo "i     Número de nodos a cambiar en el Cluster k8s"
   echo "z     Zona donde reside el Cluster k8s"
   echo "h     Ayuda :D"
   echo
}

while getopts ":n:i:z:h" option; do
   case $option in
        n)
            NAME=${OPTARG}
            ;;
        i)
            NUM_NODES=${OPTARG}
            ;;
        z)
            ZONE=${OPTARG}
            ;;
        h)
            Help
            ;;
        :)
           echo "Error: Opción inválida. Opciones válidas: -n -i -z -h"
           ;;
   esac
done

if [ $NAME ] && [ $NUM_NODES ] && [ $ZONE ]; then
	gcloud container clusters resize $NAME --num-nodes=$NUM_NODES --zone $ZONE
else
	echo "Para más información utilice -h."
fi

