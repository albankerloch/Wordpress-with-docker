use mysql;
update user set plugin='mysql_native_password' where user='root';
CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
GRANT ALL ON wordpress.* TO 'root'@'localhost';
flush privileges;
