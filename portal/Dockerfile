# Setup Debian system
FROM debian
RUN apt-get update && apt-get upgrade -y --no-install-recommends

# Install dependencies
RUN apt-get install -y --no-install-recommends \
    ssh \
    rsync \
    git \
    cvs \
    python-mysqldb \
    mariadb-client \
    mariadb-server \
    bzip2 \
    rsyslog \
    ssl-cert \
    apache2 \
    vim \
    less
RUN apt-get clean

# Install schedule CGI
RUN mkdir /var/www/html/htdocs
RUN git config --global http.sslVerify false
RUN git clone https://www.github.com/EISCAT-AARC-development/schedule.git /var/www/html/htdocs/schedule
RUN git clone https://www.github.com/EISCAT-AARC-development/tape_db.git /var/www/html/tape_db

RUN mkdir /var/www/auth
COPY src/auth.py /var/www/auth
# TODO edit conf.py in schedule/ for this path

#Set up file catalogue db
COPY config/db.sql.bz2 /var/tmp
COPY config/permission.sql /var/tmp
RUN bzcat /var/tmp/db.sql.bz2 | mysql
RUN mysql < /var/tmp/permission.sql

# Set up apache
COPY config/apache/schedule.conf /etc/apache2/sites-available/schedule.conf
COPY config/apache/schedule_ssl.conf /etc/apache2/sites-available/schedule_ssl.conf
RUN a2enmod ssl
RUN a2enmod cgid
RUN a2dissite 000-default
RUN a2ensite schedule
RUN a2ensite schedule_ssl

ENTRYPOINT service apache2 start && service mysql start && /bin/bash
# ENTRYPOINT /bin/bash
