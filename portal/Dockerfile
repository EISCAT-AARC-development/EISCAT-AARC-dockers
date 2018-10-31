FROM debian

RUN apt-get update && apt-get upgrade -y --no-install-recommends
RUN apt-get install -y --no-install-recommends \
    ssh \
    git \
    python-mysqldb \
    rsyslog \
    apache2

RUN apt-get clean

RUN mkdir /var/www/html/htdocs
RUN cd /var/www/html/htdocs
RUN git clone git@github.com:EISCAT-AARC-development/schedule.git

COPY config/ssh/id_rsa.pub .ssh/id_rsa.pub
COPY config/apache/schedule.conf /etc/apache2/sites-available/schedule.conf
COPY config/apache/schedule_ssl.conf /etc/apache2/sites-available/schedule_ssl.conf
RUN a2enmod cgi
RUN a2ensite schedule
RUN a2ensite schedule_ssl

ENTRYPOINT service apache2 start && /bin/bash
# ENTRYPOINT /bin/bash
