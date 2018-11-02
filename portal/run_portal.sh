#! /bin/bash
IMAGE_TAG=eiscat-aarc/portal:v4
CONTAINER_NAME=eiscat-aarc-portal

# Build the docker image if needed
if [[ "$(docker images -q $IMAGE_TAG 2> /dev/null)" == "" ]]; then
  docker build -t $IMAGE_TAG .
fi

# find the location of configs in current directory structure
RUN_DIR=$PWD
CONFIG_DIR="$RUN_DIR/config"

# Start data portal and server
docker start $CONTAINER_NAME || \
    docker run -it \
	   --name $CONTAINER_NAME \
	   --volume $PWD/workdir:/opt/workdir \
	   --volume /archive:/data/archive \
	   --env DATA_DIR=/var/portal \
	   --net eiscat-aarc.local \
	   --ip 192.168.111.100 \
	   --hostname portal.eiscat-aarc.local \
	   --add-host=idp.eiscat-aarc.local:192.168.111.200 \
	   --publish 8443:443 \
	   --publish 37009:37009 \
	   $IMAGE_TAG
