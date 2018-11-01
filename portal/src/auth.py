# -*- coding: iso-8859-1 -*-
# python authentication module
# The crypted passwords here permit users to change arbitrary files
# writeable by "nobody", or the user that httpd runs as

passwords = ("qhC1jPW0xLMZQ","yy3KcYfEOAMgI")
networks = ('127.', '129.242.31.', '193.45.237.', '193.167.134.',
			'193.10.33.', '158.39.70.', '158.39.47.10')

import crypt

def authorize(passwd):
	"check if a password is correct"
	for line in passwords:
		if crypt.crypt(passwd, line[:2]) == line:
			return 1

def authorize_ip(ip):
	"check if ip belongs to internal network"
	for net in networks:
		if ip.startswith(net):
			return 1
