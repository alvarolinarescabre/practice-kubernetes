#!/bin/bash

for i in $(seq 0 2)
do
	kubectl cp html/index.html chamo-demo-statefulset-$i:/usr/share/nginx/html/
done
