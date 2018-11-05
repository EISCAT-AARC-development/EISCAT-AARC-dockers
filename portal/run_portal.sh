#! /bin/bash
IMAGE_TAG=eiscat-aarc/portal:v5
CONTAINER_NAME=eiscat-aarc-portal

# Build the docker image if needed
if [[ "$(docker images -q $IMAGE_TAG 2> /dev/null)" == "" ]]; then
  docker build -t $IMAGE_TAG .
fi

# Pull relevant git repos iff they do not exist yet
#git clone https://www.github.com/EISCAT-AARC-development/schedule.git $PWD/workdir//htdocs/schedule  # /var/www/html/htdocs/schedule
#git clone https://www.github.com/EISCAT-AARC-development/tape_db.git $PWD/workdir/tape_db #/var/www/html/tape_db

# find the location of configs in current directory structure
RUN_DIR=$PWD
CONFIG_DIR="$RUN_DIR/config"

# Start data portal and server
docker start $CONTAINER_NAME || \
    docker run -it \
<<<<<<< HEAD
	   --name $CONTAINER_NAME \
	   --volume $PWD/workdir:/opt/workdir \
	   --volume /archive:/data/archive \
=======
	   --volume $PWD/workdir:/var/www/html \
	   --volume $PWD/archive:/data/archive \
>>>>>>> 83c3463d4f709c5424328ba75adb8cc511791f55
	   --env DATA_DIR=/var/portal \
	   -w /var/svs \
	   --net eiscat-aarc.local \
	   --ip 192.168.111.100 \
	   --hostname portal.eiscat-aarc.local \
	   --add-host=idp.eiscat-aarc.local:192.168.111.200 \
	   --publish 8080:80 \
	   --publish 8443:443 \
	   --publish 37009:37009 \
	   $IMAGE_TAG
