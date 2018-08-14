#!/bin/bash

sudo docker run -d -p 5000:5000 --restart=always --name registry registry:2
sudo docker build -t starwarsweb .
sudo docker tag starwarsweb starwarsweb:latest
sudo docker tag starwarsweb localhost:5000/starwarsweb
sudo docker push localhost:5000/starwarsweb

kubectl create -f pv.yaml
kubectl create -f deployment.yaml
kubectl create -f service.yaml

kubectl create secret generic starwarsweb-rebel-base-location

kubectl autoscale deployment starwarsweb-deployment --cpu-percent=50 --min=1 --max=10
