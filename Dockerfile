FROM debian:buster
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
	apt-get install -y nginx wget emacs && \
	wget http://repo.mysql.com/mysql-apt-config_0.8.13-1_all.deb
RUN echo "mysql-server mysql-server/root_password password root" | debconf-set-selections && \
	echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections
RUN apt install -y ./mysql-apt-config_0.8.13-1_all.deb
RUN apt-get update && \
        apt-get install -y mariadb-server
RUN apt-get update && \
        apt-get install -y php-fpm php-mysql
COPY default /etc/nginx/sites-enabled/default
COPY test.php /var/www/html/test.php
RUN apt-get update && \
        apt-get install -y php-mbstring php-zip php-gd php-xml php-pear php-gettext php-cgi && \
	wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN mv phpMyAdmin-4.9.0.1-all-languages /var/www/html/phpmyadmin
COPY config.inc.php /var/www/html/phpmyadmin/config.inc.php
COPY script_mysql.sql /tmp/script_mysql.sql
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xzf latest.tar.gz
RUN mv wordpress /var/www/html/wordpress
COPY wp-config.php /var/www/html/wordpress/wp-config.php 
COPY entry.sh entry.sh
RUN chmod 777 entry.sh
ENTRYPOINT ["/bin/bash","entry.sh"]