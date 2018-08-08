!#/bin/bash
CLUSTER=$1
export CADDRESS='vke cluster $1 | grep Address | awk '{print $2}''
kubectl create secret generic mysql-pass --from-literal=password=$1
kubectl create -f wavefront-heapster.yaml
