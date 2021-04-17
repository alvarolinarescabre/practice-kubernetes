#!/bin/bash

helm delete chamo-demo-joomla
kubectl delete pvc data-chamo-demo-joomla-mariadb-0
