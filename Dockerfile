FROM debian:buster
RUN apt-get update && \
	apt-get install -y nginx \
	wget \
	emacs \
	mariadb-server \
	php-fpm php-mysql php-mbstring php-zip php-gd php-xml php-pear php-gettext php-cgi
RUN	wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN	tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN	mv phpMyAdmin-4.9.0.1-all-languages /var/www/html/phpmyadmin
RUN	wget https://wordpress.org/latest.tar.gz
RUN	tar xzf latest.tar.gz
RUN	mv wordpress /var/www/html/wordpress
COPY default /etc/nginx/sites-enabled/default
COPY config.inc.php /var/www/html/phpmyadmin/config.inc.php
COPY wp-config.php /var/www/html/wordpress/wp-config.php 
COPY entry.sh entry.sh
RUN chmod 777 entry.sh
ENTRYPOINT ["/bin/bash","entry.sh"]