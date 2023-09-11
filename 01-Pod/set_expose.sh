#!/bin/bash

kubectl expose pod --port=80 --type=NodePort chamo-demo
