#!/bin/bash

# **************** Global variables
export ROOT_PATH=$(pwd)
export IMAGE_NAME="hello-helm"
export IMAGE_TAG="v0.0.1"
export URL=quay.io
export REPOSITORY=tsuedbroecker
export CONTAINER_ENGINE=podman

echo "************************************"
echo " Build and push image: $URL/$REPOSITORY/$IMAGE_NAME:$IMAGE_TAG"
echo " Container engine: $CONTAINER_ENGINE"
echo "************************************"

$CONTAINER_ENGINE login quay.io
$CONTAINER_ENGINE build -t "$URL/$REPOSITORY/$IMAGE_NAME:$IMAGE_TAG" -f Dockerfile .
$CONTAINER_ENGINE push "$URL/$REPOSITORY/$IMAGE_NAME:$IMAGE_TAG"