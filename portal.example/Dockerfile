FROM debian

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    python3-dev \
    build-essential \
    python3-pip \
    rsyslog

RUN apt clean

RUN pip3 install --upgrade pip setuptools
#RUN pip3 install git+git@github.com:EISCAT-AARC-development/schedule.git
#RUN pip3 install some_other_thing

#COPY config/apache/somehost.conf /etc/apache2/site-available/somehost.conf
#RUN a2ensite somehost

#ENTRYPOINT service apache2 start && /bin/bash
ENTRYPOINT /bin/bash
