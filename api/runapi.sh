#!/bin/bash

docker build -t my-node-app .
docker run -p 5000:5000 --name my-node-container my-node-app