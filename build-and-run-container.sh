#!/bin/bash

# **************** Global variables
export ROOT_PATH=$(pwd)
export CONTAINER_ENGINE=podman
export CONTAINER_NAME="hello-helm-verification"
export IMAGE_NAME="hello-helm-verification"
export IMAGE_TAG="v0.0.1"

# **************** Verify container
echo "************************************"
echo " Verify container locally"
echo " Container engine: $CONTAINER_ENGINE"
echo "************************************"

echo "************************************"
echo " Clean up container and image"
echo "************************************"
$CONTAINER_ENGINE image list
$CONTAINER_ENGINE container list
$CONTAINER_ENGINE container stop -f  $CONTAINER_NAME
$CONTAINER_ENGINE container rm -f  $CONTAINER_NAME
$CONTAINER_ENGINE image rm -f "$IMAGE_NAME:$IMAGE_TAG"

echo "************************************"
echo " Build image"
echo "************************************"
$CONTAINER_ENGINE build -t "$IMAGE_NAME:$IMAGE_TAG" -f Dockerfile .
pwd

$CONTAINER_ENGINE container list

echo "************************************"
echo " Run container"
echo "************************************"
$CONTAINER_ENGINE run --name=$CONTAINER_NAME \
           -it \
           -p 8080:8080 \
           "$IMAGE_NAME:$IMAGE_TAG"

$CONTAINER_ENGINE logs $CONTAINER_NAME
$CONTAINER_ENGINE port --all  