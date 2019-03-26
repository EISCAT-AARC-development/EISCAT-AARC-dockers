
# Setup Debian system
FROM debian:stretch-slim

# Install dependencies
RUN apt-get update -y; \
    apt-get install -y --no-install-recommends \
    ssh rsync \
    git cvs \
    python-mysqldb mariadb-client mariadb-server \
    bzip2 net-tools rsyslog \
    ssl-cert \
    apache2 \
    vim less wget \
    python-pip python-setuptools \
    libapache2-mod-shib2

# Install schedule CGI
RUN mkdir /var/www/html/htdocs
RUN git config --global http.sslVerify false

#
# To turn this docker nto a dev environment, comment out the 3 lines below
# As well as some lines in run_portal (see which ones in that file)
# you will need to run git clone manually in the workdir directory after the container was build and started
#
RUN git clone https://www.github.com/EISCAT-AARC-development/schedule.git /var/www/html/htdocs/schedule
RUN git clone -b portal-authz https://www.github.com/EISCAT-AARC-development/tape_db.git /var/www/html/tape_db
RUN git clone -b tokenlib_improvements https://www.github.com/EISCAT-AARC-development/shared-auth.git /var/www/auth

RUN cp /var/www/auth/* /var/www/html/tape_db

# Set up apache
COPY config/apache/schedule.conf /etc/apache2/sites-available/schedule.conf
COPY config/apache/schedule_ssl.conf /etc/apache2/sites-available/schedule_ssl.conf
RUN a2enmod ssl
RUN a2enmod cgid
RUN a2dissite 000-default
RUN a2ensite schedule_ssl

# Copy auth stuff to expected location
COPY config/requirements.txt /tmp/requirements.txt
COPY config/private_key.pem /var/www/auth/private_key.pem
COPY config/public_key.pem /var/www/auth/public_key.pem
COPY config/institutes.csv /var/www/auth/institutes.csv
COPY config/people.csv /var/www/auth/people.csv
COPY config/superusers.txt /var/www/auth/superusers.txt

# make sure the private key can be read by apache server
RUN chown www-data /var/www/auth/private_key.pem

# install authlib requirements
RUN pip install -r /tmp/requirements.txt

#Set up file catalogue db
RUN /etc/init.d/mysql start
COPY config/db.sql.bz2 /var/tmp
COPY config/permission.sql /var/tmp
COPY src/provision.sh /var/tmp

# Add script to show hostname and ip of container
COPY src/show_ip.sh /var/tmp

# Additions to add Shibboleth SP
COPY config/shibboleth/idp.eiscat-aarc.local.xml config/shibboleth/metadata-template.xml config/shibboleth/sp-cert.pem config/shibboleth/sp-key.pem /etc/shibboleth/

COPY config/shibboleth/shibboleth2.xml config/shibboleth/attribute-map.xml /etc/shibboleth/

RUN cd /etc/shibboleth && chown _shibd sp-*.pem && chmod go= sp-key.pem

COPY config/shibboleth/shibd.sh /var/tmp

COPY mysql-shib-httpd-foreground.sh /var/tmp

RUN chmod 744 /var/tmp/mysql-shib-httpd-foreground.sh

CMD ["/var/tmp/mysql-shib-httpd-foreground.sh"]
