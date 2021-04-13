#!/bin/bash

kubectl expose pod --port=80 --type=LoadBalancer chamo-demo
