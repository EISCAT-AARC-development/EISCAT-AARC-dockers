FROM ubuntu:16.04

EXPOSE 443

RUN apt update -y; \
    apt install -y --no-install-recommends \
	sudo \
	dnsutils \
	git \
	software-properties-common

RUN apt-add-repository -y ppa:ansible/ansible; \
    apt update -y; \ 
    apt install -y ansible 

RUN git clone https://github.com/OpenConext/OpenConext-DIY  /tmp/ansible/simplesaml-idp
 
COPY config/ansible/openconext-diy.yml  /tmp/ansible/simplesaml-idp/openconext-diy.yml

COPY config/ansible/inventory /tmp/ansible/simplesaml-idp/
COPY config/ansible/idp.yml /tmp/ansible/simplesaml-idp/group_vars/idp/

RUN  ansible-playbook -i /tmp/ansible/simplesaml-idp/inventory /tmp/ansible/simplesaml-idp/openconext-diy.yml

COPY config/metadata /var/www/simplesamlphp/metadata

CMD ["apachectl","-D", "FOREGROUND"]
