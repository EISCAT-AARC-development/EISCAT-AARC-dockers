
# Setup Debian system
FROM ubuntu:18.04

RUN apt update 
#RUN apt-get upgrade -y --no-install-recommends

# Install dependencies
# TODO: remove mariadb-server package once mysql is externalized
RUN apt install -y --no-install-recommends \
    ssh rsync \
    git cvs \
    python-mysqldb mariadb-client \
    bzip2 net-tools rsyslog \
    vim less wget \
    python-pip python-setuptools \
    mariadb-server


# Install schedule CGI
#RUN mkdir -p /var/www/html/htdocs
RUN git config --global http.sslVerify false

#
# To turn this docker nto a dev environment, comment out the 3 lines below
# As well as some lines in run_portal (see which ones in that file)
# you will need to run git clone manually in the workdir directory after the container was build and started
#
RUN git clone -b dev_hack https://www.github.com/EISCAT-AARC-development/tape_db.git /var/www/html/tape_db
RUN git clone -b tokenlib_improvements https://www.github.com/EISCAT-AARC-development/shared-auth.git /var/www/auth

#COPY app/tape_db /var/www/html/tape_db

# Copy auth stuff to expected location
# COPY config/private_key.pem 	/var/www/auth/private_key.pem
# COPY config/public_key.pem 	/var/www/auth/public_key.pem
COPY config/institutes.csv 	/var/www/auth/institutes.csv
COPY config/people.csv 		/var/www/auth/people.csv
COPY config/superusers.txt 	/var/www/auth/superusers.txt

#Create certs for webservice
#RUN /usr/bin/openssl req -x509 -newkey rsa:4096 -nodes -keyout /var/www/auth/private_key.pem -out /var/www/auth/public_key.pem -days 365 -subj "/C=SE/ST=EISCAT/L=EISCAT/O=EISCAT/OU=Org/CN=tape_db.eiscat-aarc.local"

# use the below if you already have a cert
# COPY config/private_key.pem /var/www/auth/private_key.pem
# COPY config/public_key.pem /var/www/auth/public_key.pem

# make sure the private key can be read by apache server
#RUN chown root /var/www/auth/private_key.pem
RUN chmod -Rf 700 /var/www/auth/

# install authlib requirements
COPY config/requirements.txt 	/tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt


#TODO: remove after db is externalized
#RUN /etc/init.d/mysql start
COPY config/db.sql.bz2 /var/tmp
COPY config/permission.sql /var/tmp
COPY src/provision.sh /var/tmp

COPY app/run_service.sh		/root/

RUN  chmod a+x 			/root/run_service.sh

CMD ["/root/run_service.sh"]
