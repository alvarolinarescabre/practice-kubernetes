#!/bin/bash

kubectl create secret generic chamo-demo-secrets --from-env-file=.env

