#!/bin/bash

/init.sh
/etc/init.d/apache2 stop
/usr/sbin/apache2ctl -D FOREGROUND
