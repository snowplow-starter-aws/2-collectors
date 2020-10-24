#!/bin/bash


IMAGE_TAG=latest
REPO=petersiemen
NAME=snowplow-stream-collector

docker build -t ${NAME} .
docker tag ${NAME} ${REPO}/${NAME}:${IMAGE_TAG}
docker push ${REPO}/${NAME}:${IMAGE_TAG}
