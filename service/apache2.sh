#!/bin/bash

mkdir -p /var/log/apache2
exec /usr/sbin/apachectl -D FOREGROUND
