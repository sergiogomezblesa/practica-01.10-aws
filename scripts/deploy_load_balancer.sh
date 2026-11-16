#!/bin/bash
set -ex
set -a

source .env

apt update 

apt install nginx -y

if [ -L /etc/nginx/sites-enabled/default ]; then
    unlink /etc/nginx/sites-enabled/default
fi

envsubst '${IP_FRONTEND_1} ${IP_FRONTEND_2} ${LETS_ENCRYPT_DOMAIN}' < ../conf/load-balancer.conf.template > /etc/nginx/sites-available/${LETS_ENCRYPT_DOMAIN}.conf

ln -sf /etc/nginx/sites-available/${LETS_ENCRYPT_DOMAIN}.conf /etc/nginx/sites-enabled/${LETS_ENCRYPT_DOMAIN}.conf

systemctl reload nginx