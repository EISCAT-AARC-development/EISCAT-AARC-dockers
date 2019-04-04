# eiscat-aarc-dev

A self contained development environment for eiscat-aarc

## DEVELOPMENT DEPLOYMENT ON A SINGLE MACHINE USING A DOCKER NETWORK

* check out the shibbolet branch of the EISCAT DOCKERS (git@github.com:EISCAT-AARC-development/EISCAT-AARC-dockers.git)
* run dockernet.sh to create the required docker network
* add the hosts in add_to_hosts_file.txt to your local hosts file
* cd into ssp-idp and run build_ssp-idp.sh
* execute run_ssp-idp.sh to start the test IDP
* open a browser and confirm you can access https://idp.eiscat-aarc.local (uses selfsinged certificate so you may expect a warnign about that)

These user credentials are supported: https://github.com/surfnet-niels/simplesaml-idp/blob/master/roles/simplesaml/templates/config/logins.json

For example user professor1 passwd professor1 

* cd into portal and run build_portal.sh
* execute run_portal.sh to start the portal application
* open a browser and confirm you can access https://portal.eiscat-aarc.local (uses selfsinged certificate so you may expect a warnign about that)

example URL is https://portal.eiscat-aarc.local/schedule/tape2.cgi?date=20121105&exp=beata_cp1_2.0u_NO&dl=1

* cd into tapedb ./build_tape
* run ./build_tapedb.sh
* set variables defined in run_tapedb.sh according to your environment
* run ./run_tape.sh
* cd /var/www/html/tapedb/
* python serve_files.py

## QA DEPLOYMENT ON MULTIPLE MACHINE

* check out the Shibboleth branch of the EISCAT DOCKERS (git@github.com:EISCAT-AARC-development/EISCAT-AARC-dockers.git)

### SET UP IDP

* change the following variables in ssp-idp/config/ansible/idp.yml:
    * idp_hostname
    * idp_sp
    * ssp_title_suffix
    * if you do not need letsencrypt change `resolvable_fqdn` to false, otherwise 
    leave it to true and set letsencrypt_* variables

* change ssp-idp/run_ssp-idp.sh in the following way:
    * comment out the following arguments 
        --net eiscat-aarc.local \
        --ip 192.168.111.200 \
    * in --add-host arguments change the IPs of the other host according to the actual IPs
    * change --hostname argument with your <YOUR_FQDN>
    * publish ports on 80 and 443

* cd into ssp-idp and run build_ssp-idp.sh

* execute run_ssp-idp.sh to start the test IDP

* open a browser and confirm you can access https://<YOUR_FQDN> (uses selfsinged certificate so you may expect a warnign about that)

These user credentials are supported: https://github.com/surfnet-niels/simplesaml-idp/blob/master/roles/simplesaml/templates/config/logins.json

For example user professor1 passwd professor1 

### SET UP PORTAL AND DATA SERVER

* cd into portal and run build_portal.sh

* execute run_portal.sh to start the portal application

* open a browser and confirm you can access https://portal.eiscat-aarc.local (uses selfsinged certificate so you may expect a warnign about that)

example URL is https://portal.eiscat-aarc.local/schedule/tape2.cgi?date=20121105&exp=beata_cp1_2.0u_NO&dl=1




