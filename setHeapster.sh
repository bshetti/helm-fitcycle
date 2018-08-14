#!/bin/bash
sed 's/CLUSTERID/'"$1"'/' wavefront-heapster.yaml > tempheap.yaml
kubectl create -f tempheap.yaml

