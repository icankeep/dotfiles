#!/bin/bash

docker run -it --rm --name haproxy \
    -p 1936:1936 \
    -p 443:443 \
    -p 80:80 \
    -v $PWD/ssl:/ssl \
    -v $PWD/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg:ro \
    haproxy
