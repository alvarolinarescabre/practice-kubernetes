#!/bin/bash

gcloud container clusters create cice-chamo-demo --region europe-west3 --release-channel regular --project alc-demo --num-nodes=1 &&

gcloud container clusters get-credentials cice-chamo-demo --region europe-west3 --project alc-demo
