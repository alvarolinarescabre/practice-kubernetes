#!/bin/bash

Help()
{
   # Display Help
   echo "Script para crear un cluster k8s."
   echo
   echo "Syntax: create_cluster.sh [-n|-i|-z|-h]"
   echo "options:"
   echo "n     Nombre del Cluster k8s"
   echo "i     Número de nodos del Cluster k8s"
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
	gcloud container clusters create $NAME --machine-type=g1-small --num-nodes=$NUM_NODES --zone $ZONE
	gcloud container clusters get-credentials $NAME --zone $ZONE
else
	echo "Para más información utilice -h."
fi

