#!/bin/bash

if [ ! -f /home/app/password.txt ]; then
  mkdir -p /home/app
  chmod 755 /home/app
  ln -s /var/www /home/app/public
  pwgen 16 1 > /home/app/password.txt
  chown -R app:www-data /home/app
  mkdir -p /var/www
  chown -R app:www-data /var/www
  chmod 755 /var/www
fi
echo app:$(cat /home/app/password.txt) | chpasswd
