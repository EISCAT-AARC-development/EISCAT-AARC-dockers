#! /bin/bash
IMAGE_TAG=eiscat-aarc/portal:v1
CONTAINER_NAME=eiscat-aarc-portal

# Build the docker image if needed
if [[ "$(docker images -q $IMAGE_TAG 2> /dev/null)" == "" ]]; then
  docker build -t $IMAGE_TAG .
fi

# find the location of configs in current directory structure
RUN_DIR=$PWD
CONFIG_DIR="$RUN_DIR/config"

# Start SVS
docker run -it \
    -v $PWD/workdir:/opt/workdir \
    -e DATA_DIR=/var/portal \
    -w /var/svs \
    --net eiscat-aarc.local \
    --ip 192.168.111.1 \
    --add-host=portal.eiscat-aarc.local:192.168.111.1 \
    --add-host=data.eiscat-aarc.local:192.168.111.2 \
    --add-host=idp.eiscat-aarc.local:192.168.111.200 \
    --hostname portal.eiscat-aarc.local \
    --expose 80 \
    --expose 443 \
    $IMAGE_TAG
