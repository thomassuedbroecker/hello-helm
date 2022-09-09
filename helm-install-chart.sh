#!/bin/bash
export ROOT_PATH=$(pwd)
export CHART_PATH="/chart/hello"
export CHART_NAME=hello
export CHART_VERSION=1
export DEBUG_NAME=hello-install

cd $ROOT_PATH/$CHART_PATH

helm dependency update 
helm install --dry-run --debug $DEBUG_NAME .
helm lint
helm install $CHART_NAME .
