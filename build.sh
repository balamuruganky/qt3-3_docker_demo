#!/usr/bin/env bash

docker-compose build --build-arg user=$USER --build-arg uid=$(id -u) --build-arg gid=$(id -g)
