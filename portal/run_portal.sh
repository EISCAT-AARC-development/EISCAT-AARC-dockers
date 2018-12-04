#! /bin/bash
TYPE=dev
IMAGE_TAG=eiscat-aarc/portal:v6
CONTAINER_NAME=eiscat-aarc-portal

# Build the docker image if needed
if [[ "$(docker images -q $IMAGE_TAG 2> /dev/null)" == "" ]]; then
  docker build -t $IMAGE_TAG .
fi

# find the location of configs in current directory structure
RUN_DIR=$PWD
CONFIG_DIR="$RUN_DIR/config"


# Start data portal and server
#docker start $CONTAINER_NAME || \
    docker run -it \
	   --env DATA_DIR=/var/portal \
	   --net eiscat-aarc.local \
	   --ip 192.168.111.100 \
	   --hostname portal.eiscat-aarc.local \
	   --add-host=idp.eiscat-aarc.local:192.168.111.200 \
	   --publish 8443:443 \
	   --publish 37009:37009 \
	   $IMAGE_TAG

#	   --volume $PWD/workdir:/var/www/html \
#           --volume $PWD/authdir:/var/www/auth \
#	   --volume $PWD/archive:/data/archive \

