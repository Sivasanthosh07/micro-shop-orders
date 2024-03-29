#!/bin/bash
kubectl config use-context k3d-micro-shop-local 
docker build -t orders:latest -f docker/micro-shop-orders.Dockerfile . --no-cache
k3d image import --cluster micro-shop-local orders:latest
kubectl rollout restart deployment orders-deployment -n default
