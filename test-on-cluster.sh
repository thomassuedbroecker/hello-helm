#!/bin/bash
export ROOT_PATH=$(pwd)
export NAMESPACE=default
export CHART_NAME=hello

kubectl get -n $NAMESPACE pods | grep $CHART_NAME
POD=$(kubectl get -n $NAMESPACE pods | grep $CHART_NAME | head -n 1 | awk '{print $1;}')
kubectl exec -n $NAMESPACE $POD  -- curl -s http://localhost:8080