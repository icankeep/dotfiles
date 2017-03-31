#!/bin/bash

domain=$1

if [ -z $domain ]; then
    echo "need a domain"
    exit 1
fi

if [ -e $domain ]; then
    echo "$domain already exits"
    exit 1
fi

mkdir $domain
cd $domain

ORG="$(whoami)@$(hostname)"
openssl genrsa -out server.key 4096
openssl req -sha256 -new -key server.key -out server.csr -subj "/C=CN/ST=MyState/L=MyCity/O=0000 $ORG HTTPS Reverse Proxy/OU=MyUnit/CN=$domain"
openssl x509 -sha256 -req -days 3650 -in server.csr -signkey server.key -out server.crt
cat server.crt server.key > server.pem
