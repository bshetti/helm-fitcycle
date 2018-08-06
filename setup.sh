!#/bin/bash
kubectl create secret generic mysql-pass --from-literal=password=$1
kubectl create -f wavefront-heapster.yaml
