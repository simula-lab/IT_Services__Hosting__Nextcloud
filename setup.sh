#!/bin/bash
# takes two paramters, the domain name and the email to be associated with the certificate
DOMAIN=$1
EMAIL=$2

MYSQL_PASSWORD=${openssl rand 30 | base64 -w 0}
MYSQL_ROOT_PASSWORD=${openssl rand 30 | base64 -w 0}

echo DOMAIN=${DOMAIN} > .env
echo EMAIL=${EMAIL} >> .env
echo MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} >> .env

echo MYSQL_PASSWORD=${MYSQL_PASSWORD} >  db.env
echo MYSQL_DATABASE=nextcloud >> db.env
echo MYSQL_USER=nextcloud >> db.env

docker-compose -f ./docker-compose.yaml up -d 

