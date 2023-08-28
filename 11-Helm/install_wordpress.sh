#!/bin/bash

helm install my-wordpress bitnami/wordpress --version 17.1.3 --set=service.type=ClusterIP --set=ingress.enabled=True