#! /bin/bash
echo "Provisioning EISCAT downloads database"
/bin/bzcat /var/tmp/db.sql.bz2 | mysql
echo "Provisioning EISCAT database permissions"
/usr/bin/mysql < /var/tmp/permission.sql
echo "Fetching IdP metadata from https://idp.eiscat-aarc.local/saml2/idp/metadata.php"
/usr/bin/wget --no-check-certificate https://idp.eiscat-aarc.local/saml2/idp/metadata.php -O /etc/shibboleth/idp.eiscat-aarc.local.xml
