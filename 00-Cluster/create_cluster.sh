#!/bin/bash

Help()
{
   # Display Help
   echo "Script para crear un cluster k8s en la región europe-west3."
   echo
   echo "Syntax: create_cluster.sh [-p|-n|-h]"
   echo "options:"
   echo "p     Proyecto de Google Cloud"
   echo "n     Nombre del Cluster k8s"
   echo "h     Ayuda :D"
   echo
}

while getopts ":p:n:h" option; do
   case $option in
        p)
            PROJECT=${OPTARG}
            ;;
        n)
            NAME=${OPTARG}
            ;;
        h)
            Help
            ;;
        :)
           echo "Error: Opción inválida. Opciones válidas: -p -n -h"
           ;;
   esac
done


if [ $PROJECT ] && [ $NAME ]; then
	gcloud container clusters create $NAME --region europe-west3 --release-channel regular --project $PROJECT --num-nodes=1 &&
	gcloud container clusters get-credentials $NAME --region europe-west3 --project $PROJECT
else
	echo "Para más información utilice -h."
fi

