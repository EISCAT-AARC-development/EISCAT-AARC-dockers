#!/bin/bash

# TODO: remove after db is externalized
/etc/init.d/mysql start
/var/tmp/provision.sh

/usr/bin/python /var/www/html/tape_db/serve_files.py
