#! /bin/bash

IMAGE_TAG=eiscat-aarc/ssp-idp:v1
CONTAINER_NAME=idp

# Setup the network if needed
# if [ ! "$(docker network ls | grep eiscat-aarc.local)" ]; then
#   echo "Creating eiscat-aarc.local network ..."
#   ../dockernet.sh
# else
#   echo "eiscat-aarc.local network exists."
# fi
# 

# Build the docker image if needed
if [[ "$(docker images -q $IMAGE_TAG 2> /dev/null)" == "" ]]; then
  echo "Creating $IMAGE_TAG docker image ..."
  docker build -t $IMAGE_TAG .
else
  echo "$IMAGE_TAG docker image exists..."
fi


if [ "$(docker ps -a -q -f name=$CONTAINER_NAME)" != "" ]; then
    echo "docker container $CONTAINER_NAME exists"
    echo "starting $CONTAINER_NAME"
    docker start $CONTAINER_NAME
else
    echo "no docker container found"
    echo "creating container $CONTAINER_NAME from image $IMAGE_TAG"
    docker run -d \
           --name $CONTAINER_NAME \
	   --rm \
	   --network eiscat-aarc.local \
	   --ip 192.168.111.102 \
	   --add-host portal:192.168.111.100 \
	   --add-host data:192.168.111.105 \
           --hostname idp.eiscat.se \
	   --publish 192.168.11.102:80:80 \
	   --publish 192.168.11.102:443:443 \
           $IMAGE_TAG
fi

