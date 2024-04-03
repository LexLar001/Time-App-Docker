#!/bin/bash

docker network create my-network

docker run -d \
  --name my-mysql-container \
  --network my-network \
  -e MYSQL_ROOT_PASSWORD=password \
  -e MYSQL_DATABASE=time_db \
  -v mysql_data:/var/lib/mysql \
  -p 3306:3306 \
  mysql