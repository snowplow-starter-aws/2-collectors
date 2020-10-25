#!/bin/bash


IMAGE_TAG=1.0.1
REPO=petersiemen
NAME=snowplow-stream-collector

docker build -t ${NAME}:${IMAGE_TAG} .
docker tag ${NAME}:${IMAGE_TAG} ${REPO}/${NAME}:${IMAGE_TAG}
docker push ${REPO}/${NAME}:${IMAGE_TAG}
