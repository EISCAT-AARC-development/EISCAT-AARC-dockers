
# Setup Debian system
FROM debian
RUN apt-get update && apt-get upgrade -y --no-install-recommends

# Install dependencies
RUN apt-get install -y --no-install-recommends \
    ssh rsync \
    git cvs \
    python-mysqldb mariadb-client mariadb-server \
    bzip2 net-tools rsyslog \
    ssl-cert \
    apache2 \
    vim less \
    libapache2-mod-shib2
RUN apt-get clean

# Install schedule CGI
RUN mkdir /var/www/html/htdocs
RUN git config --global http.sslVerify false
RUN git clone https://www.github.com/EISCAT-AARC-development/schedule.git /var/www/html/htdocs/schedule
RUN git clone https://www.github.com/EISCAT-AARC-development/tape_db.git /var/www/html/tape_db

# Set up apache
COPY config/apache/schedule.conf /etc/apache2/sites-available/schedule.conf
COPY config/apache/schedule_ssl.conf /etc/apache2/sites-available/schedule_ssl.conf
RUN a2enmod ssl
RUN a2enmod cgid
RUN a2dissite 000-default
# RUN a2ensite schedule
RUN a2ensite schedule_ssl

# setup eiscat user with shell and home dir
#RUN useradd -m -s /bin/bash eiscat

# Copy auth scrpt to expected location
COPY src/auth.py /var/www/auth/auth.py

#Set up file catalogue db
RUN /etc/init.d/mysql start
COPY config/db.sql.bz2 /var/tmp
COPY config/permission.sql /var/tmp
COPY config/permission.sql /var/tmp
COPY src/provision_db.sh /var/tmp

# Add script to show hostname and ip of container
COPY src/show_ip.sh /var/tmp

# Additions to add Shibboleth SP
#COPY config/shibboleth/apache-cert.pem \
#     config/shibboleth/apache-chain.pem \
#     /etc/ssl/certs/

#COPY config/shibboleth/apache-key.pem \
#    /etc/ssl/private/

#COPY config/shibboleth/default-ssl.conf \
#     /etc/apache2/sites-available/

#RUN a2enmod ssl && \
#    a2ensite default-ssl

COPY config/shibboleth/idp.eiscat-aarc.local.xml config/shibboleth/sp-cert.pem config/shibboleth/sp-key.pem /etc/shibboleth/

COPY config/shibboleth/shibboleth2.xml config/shibboleth/attribute-map.xml /etc/shibboleth/

RUN cd /etc/shibboleth && chown _shibd sp-*.pem && chmod go= sp-key.pem

COPY config/shibboleth/shibd.sh /var/tmp

ENTRYPOINT service apache2 start && service mysql start && service shibd start && service shibd status && /var/tmp/provision_db.sh && /var/tmp/show_ip.sh &&/bin/bash

