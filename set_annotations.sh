#!/bin/bash

kubectl annotate deployment.v1.apps/chamo-demo-deployment kubernetes.io/change-cause="image updated to 1.9.1"
kubectl set image deployment chamo-demo-deployment webserver-00=nginx:1.9.1
kubectl rollout history deployment chamo-demo-deployment
