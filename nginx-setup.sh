#!/bin/bash

# Updating and installing dependencies
apt-get update
apt-get install certbot
apt-get install python3-certbot-nginx

# Insert domain into nginx
cp nginx_conf_template.txt /etc/nginx/conf.d/$1.conf
sed -i "s/<DOMAIN>/\\$1/" /etc/nginx/conf.d/$1.conf
nginx -t
nginx -s reload

# Obtain ssl certificate
certbot --nginx -d $1
(crontab -l 2>/dev/null; echo "0 12 * * * /usr/bin/certbot renew --quiet") | crontab -
