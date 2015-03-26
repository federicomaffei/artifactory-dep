#!/bin/bash
docker rm menus-test
docker pull docker.otenv.com/menus-stress-test:latest
docker run --name menus-test -e "HOST=$1" -e -it docker.otenv.com/menus-stress-test:latest
docker cp menus-test:/scripts/results/$filename ./scripts
docker cp menus-test:/scripts/ids.txt ./scripts