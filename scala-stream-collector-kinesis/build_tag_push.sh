#!/bin/bash


IMAGE_TAG=1.0.1
REPO=petersiemen
NAME=snowplow-scala-stream-collector-kinesis

docker build -t ${NAME}:${IMAGE_TAG} .
docker tag ${NAME}:${IMAGE_TAG} ${REPO}/${NAME}:${IMAGE_TAG}
docker push ${REPO}/${NAME}:${IMAGE_TAG}
