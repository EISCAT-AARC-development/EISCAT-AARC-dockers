FROM debian

RUN apt-get update && apt-get upgrade -y --no-install-recommends \
RUN apt-get install -y --no-install-recommends \
    build-essential \
    git \
    python3-setuptools-git \
    python3-mysqldb \
    python3-dev \
    python3-pip \
    rsyslog \
    apache2
RUN apt-get clean

RUN pip3 install git+git@github.com:EISCAT-AARC-development/schedule.git

COPY config/apache/schedule.conf /etc/apache2/sites-available/schedule.conf
COPY config/apache/schedule_ssl.conf /etc/apache2/sites-available/schedule_ssl.conf
RUN a2enmod cgi
RUN a2ensite schedule
RUN a2ensite schedule_ssl

ENTRYPOINT service apache2 start && /bin/bash
# ENTRYPOINT /bin/bash
