#! /bin/bash
IMAGE_TAG=eiscat-aarc/ssp-idp:v1
CONTAINER_NAME=eiscat-aarc_ssp-idp

# Steup the netwerk if needed
if [ ! "$(docker network ls | grep eiscat-aarc.local)" ]; then
  echo "Creating eiscat-aarc.local network ..."
  ../dockernet.sh
else
  echo "eiscat-aarc.local network exists."
fi
# Build the docker image if needed
if [[ "$(docker images -q $IMAGE_TAG 2> /dev/null)" == "" ]]; then
  echo "Creating $IMAGE_TAG docker container ..."
  docker build -t $IMAGE_TAG .
else
  echo "$IMAGE_TAG docker container exists..."
fi

# Start SSP IDP
docker start -i $CONTAINER_NAME || docker run -it \
    --name $CONTAINER_NAME \
    --net eiscat-aarc.local \
    --ip 192.168.111.200 \
    --add-host=portal.eiscat-aarc.local:192.168.111.100 \
    --add-host=data.eiscat-aarc.local:192.168.111.101 \
    --add-host=idp.eiscat-aarc.local:192.168.111.200 \
    --hostname idp.eiscat-aarc.local \
    --publish 9080:80 \
    --publish 9443:443 \
    $IMAGE_TAG
