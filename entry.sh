#!/bin/bash
service mysql start
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'alban'@'localhost' IDENTIFIED BY 'haha';" | mysql -u root
ech "FLUSH PRIVILEGES;" | mysql -u root
service nginx start
service php7.3-fpm start
sleep infinity
