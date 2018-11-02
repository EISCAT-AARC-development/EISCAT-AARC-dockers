#! /bin/bash
echo "Provisioning EISCAT downloads database"
/bin/bzcat /var/tmp/db.sql.bz2 | mysql
echo "Provisioning EISCAT database permissions"
/usr/bin/mysql < /var/tmp/permission.sql

