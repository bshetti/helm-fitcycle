# container-fitcycle

Instructions on getting this application up in a cluster:

This uses helm charts to bring up the application
(currently only wavefront proxy, api-server, and mysql via helm)

wavefront heapster is a singular yaml to run

## Pre helm

```yaml
kubectl create secret generic mysql-pass --from-literal=password=YOUR_PASSWORD
```

REPLACE PASSWORD with whatever you like

This brings up the wavefront cluster stats module (via heapster)

```yaml
kubectl create -f wavefront-heapster.yaml
```

INSTALL HELM 
SWITCH CONTEXT TO CLUSTER YOU WANT THIS TO RUN ON
RUN FOLLOWING:

```yaml
helm init
```
 
## Bring up the Wavefront Proxy

In the /wavefront-proxy/value.yaml file please your values for

wavefrontUrl
wavefrontToken

```yaml
helm install --name helm-proxy -f ./wavefront-proxy/values.yaml ./wavefront-proxy 
```

## Bring up the mysql service

```yaml
helm install --name helm-mysql -f ./mysql/values.yaml ./mysql
```

## Bring up the api service

```yaml
helm install --name helm-api -f ./api-server/values.yaml ./api-server
```

## Bring up the web service

```yaml
helm install --name helm-web -f ./web-server/values.yaml ./web-server
```

END
