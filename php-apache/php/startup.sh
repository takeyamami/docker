#!/bin/bash
chown apache:apache /var/www/site/
chmod 705 /var/www

service crond start
service apache2 start

while true
do
    sleep 10
done