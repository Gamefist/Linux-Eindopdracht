#!/bin/bash

if ! dpkg -l apache2;
then
sudo apt-get update
sudo apt-get install -y apache2
sudo ufw allow in "Apache Full"
fi

if ! dpkg -l wordpress;
then
sudo apt-get install -y wordpress php libapache2-mod-php mysql-server php-mysql
touch /etc/apache2/sites-available/wordpress.conf
echo "Alias /wordpress /usr/share/wordpress
<Directory /usr/share/wordpress>
Options FollowSymLinks
AllowOverride Limit Options FileInfo
DirectoryIndex index.php
Order allow,deny
Allow from all
</Directory>
<Directory /usr/share/wordpress/wp-content>
Options FollowSymLinks
Order allow,deny
Allow from all
</Directory>" >> /etc/apache2/sites-available/wordpress.conf

sudo a2ensite wordpress
sudo a2enmod rewrite

mysql -e "CREATE DATABASE wordpress CHARACTER SET UTF8 COLLATE UTF8_BIN;
CREATE USER 'dennis'@'%' IDENTIFIED BY 'wordpress123';
GRANT ALL PRIVILEGES ON wordpress.* TO 'dennis'@'%';
FLUSH PRIVILEGES;"

echo "<?php
define('DB_NAME', 'wordpress');
define('DB_USER', 'dennis');
define('DB_PASSWORD', 'wordpress123');
define('DB_HOST', 'localhost');
define('DB_COLLATE', 'utf8_general_ci');
define('WP_CONTENT_DIR', '/usr/share/wordpress/wp-content');
?>" >> /etc/wordpress/config-10.0.6.142.php

systemctl reload apache2	
systemctl restart apache2
service mysql restart

fi
	
