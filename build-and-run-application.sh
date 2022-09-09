#!/bin/bash

echo "************************************"
echo " Run appliation locally"
echo "************************************"
npm cache clean -force
npm install -force
node apps.js