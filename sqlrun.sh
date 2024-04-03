#!/bin/bash

docker run -d \
  --name my-mysql-container \
  -e MYSQL_ROOT_PASSWORD=password \
  -e MYSQL_DATABASE=time_db \
  -v mysql_data:/var/lib/mysql \
  -p 3306:3306 \
  mysql