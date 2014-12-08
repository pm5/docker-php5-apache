#!/bin/bash

/init.sh
mkdir -p /app/log /app/public
chown app:app /app/log
chown app:www-data /app/public
/etc/init.d/apache2 stop
/usr/sbin/apache2ctl -D FOREGROUND
