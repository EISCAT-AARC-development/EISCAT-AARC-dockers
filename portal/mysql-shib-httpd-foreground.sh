#!/bin/bash

set -e

/etc/init.d/mysql start

./var/tmp/provision.sh

/etc/init.d/shibd start

exec apachectl -D FOREGROUND
