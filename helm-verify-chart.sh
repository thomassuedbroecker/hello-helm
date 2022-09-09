#!/bin/bash
export ROOT_PATH=$(pwd)
export CHART_PATH="/chart/hello"
export CHART_NAME=hello
export CHART_VERSION=1.0
export INSTALL_NAME=hello-install

cd $ROOT_PATH/$CHART_PATH

helm dependency update 
helm install --dry-run --debug $INSTALL_NAME .
helm lint