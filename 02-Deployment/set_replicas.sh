#!/bin/bash

kubectl scale deployment chamo-demo-deployment --replicas=$1
