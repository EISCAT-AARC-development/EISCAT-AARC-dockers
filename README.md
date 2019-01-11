# eiscat-aarc-dev
A self contained development environment for eiscat-aarc

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

