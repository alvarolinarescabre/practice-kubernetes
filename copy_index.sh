#!/bin/bash

NFS_SERVER_POD=$(kubectl get pods --selector=role=nfs-server | grep -v NAME | awk '{print $1}')

kubectl cp html/index.html $NFS_SERVER_POD:/nfsshare
