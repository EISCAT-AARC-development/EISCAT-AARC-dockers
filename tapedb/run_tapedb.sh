#! /bin/bash
TYPE=dev
IMAGE_TAG=eiscat-aarc/tapedb:v3
CONTAINER_NAME=eiscat-aarc-tapedb

# Build the docker image if needed
if [[ "$(docker images -q $IMAGE_TAG 2> /dev/null)" == "" ]]; then
    echo "run build script before running container" 
    exit -1
fi

# find the location of configs in current directory structure
RUN_DIR=$PWD
CONFIG_DIR="$RUN_DIR/config"

HOSTNAME=tape_db.eiscat-aarc.local

# the location of the auth library
CONTAINER_PYTHONPATH=/var/www/auth

HOST_TOKEN_SIGNING_PUB_KEY_PATH=$(realpath ../portal/config/public_key.pem)
CONTAINER_TOKEN_SIGNING_PUB_KEY_PATH=/var/www/auth/token_signing_pub_key.pem

HOST_DATA_SERVER_SSL_CERT_PATH=$CONFIG_DIR/public_key.pem
CONTAINER_DATA_SERVER_SSL_CERT_PATH=/var/www/auth/public_key.pem

HOST_DATA_SERVER_SSL_KEY_PATH=$CONFIG_DIR/private_key.pem
CONTAINER_DATA_SERVER_SSL_KEY_PATH=/var/www/auth/private_key.pem

if [ "$(docker ps -a -q -f name=$CONTAINER_NAME)" != "" ]; then
    echo "docker container $CONTAINER_NAME exists"
    echo "starting $CONTAINER_NAME"
    docker start $CONTAINER_NAME
else
    echo "no docker container found"
    echo "creating container $CONTAINER_NAME from image $IMAGE_TAG"
    docker run -it \
    --name $CONTAINER_NAME \
    --env DATA_DIR=/var/portal \
    --env TOKEN_SIGNING_PUB_KEY_PATH=$CONTAINER_TOKEN_SIGNING_PUB_KEY_PATH \
    --env DATA_SERVER_SSL_CERT_PATH=$CONTAINER_DATA_SERVER_SSL_CERT_PATH \
    --env DATA_SERVER_SSL_KEY_PATH=$CONTAINER_DATA_SERVER_SSL_KEY_PATH \
    --env PYTHONPATH=$CONTAINER_PYTHONPATH \
	--net eiscat-aarc.local \
	--ip 192.168.111.222 \
	--hostname $HOSTNAME \
	--publish 37009:37009 \
	--volume $RUN_DIR/app:/var/www/html/app \
    --volume $HOST_TOKEN_SIGNING_PUB_KEY_PATH:$CONTAINER_TOKEN_SIGNING_PUB_KEY_PATH \
    --volume $HOST_DATA_SERVER_SSL_CERT_PATH:$CONTAINER_DATA_SERVER_SSL_CERT_PATH \
    --volume $HOST_DATA_SERVER_SSL_KEY_PATH:$CONTAINER_DATA_SERVER_SSL_KEY_PATH \
    --volume $RUN_DIR/app/tape_db/tapelib.py:/var/www/html/tape_db/tapelib.py \
    --volume $RUN_DIR/app/tape_db/serve_files.py:/var/www/html/tape_db/serve_files.py \
    --volume "$RUN_DIR/sample_data/tau2as_cp1@sod":"/data/archive/2003/" \
	$IMAGE_TAG
fi

