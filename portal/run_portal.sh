#! /bin/bash

TYPE=dev
IMAGE_TAG=eiscat-aarc/portal:v6
CONTAINER_NAME=portal

# Build the docker image if needed
if [[ "$(docker images -q $IMAGE_TAG 2> /dev/null)" == "" ]]; then
  docker build -t $IMAGE_TAG .
fi

# find the location of configs in current directory structure
RUN_DIR=$PWD
CONFIG_DIR="$RUN_DIR/config"


if [ "$(docker ps -a -q -f name=$CONTAINER_NAME)" != "" ]; then
    echo "docker container $CONTAINER_NAME exists"
    echo "starting $CONTAINER_NAME"
    docker start $CONTAINER_NAME
else
    echo "no docker container found"
    echo "creating container $CONTAINER_NAME from image $IMAGE_TAG"
    docker run -d \
        --name $CONTAINER_NAME \
        --env DATA_DIR=/var/portal \
        --net eiscat-aarc.local \
        --ip 192.168.111.100 \
        --hostname portal.eiscat.se \
        --add-host=idp.eiscat.se:192.168.111.102 \
        --add-host=data.eiscat.se:192.168.111.105 \
        --publish 192.168.11.100:443:443 \
        $IMAGE_TAG
fi



