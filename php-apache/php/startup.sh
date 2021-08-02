#!/bin/bash
chown ec2-user:ec2-user /var/www/site/
chmod 705 /var/www

/sbin/service crond start
/sbin/service httpd start

/etc/rc.d/init.d/sshd start

while true
do
    sleep 10
done