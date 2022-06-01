#!/bin/bash

task="$1"

if [[ -n "${task}" ]]; then
  echo "Task: $task"
fi

if [ "$task" == "build" ]; then
  docker-compose down
  docker-compose build
fi

if [ "$task" == "clean-build-all" ]; then
  docker-compose down
  docker image rm redis:7.0.0-alpine
  docker image rm wp-backend_django
  docker image rm postgis/postgis:14-master
  docker-compose build
fi

if [ "$task" == "clean-build-django" ]; then
  docker-compose down
  docker image rm wp-backend_django
  docker-compose build
fi

docker-compose up
