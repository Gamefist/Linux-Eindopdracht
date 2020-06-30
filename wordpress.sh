#!/bin/bash

if ! dpkg -l apache2;
	then
		sudo apt-get update
		sudo apt-get install -y apache2
		sudo ufw allow in "Apache Full"
fi

if ! dpkg -l wordpress;
	then
		sudo apt-get install wordpress php libapache2-mod-php mysql-server php-mysql
		echo 'Alias /blog /usr/share/wordpress
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
</Directory>' > /etc/apache2/sites-available/wordpress.conf
		sudo a2ensite wordpress
		sudo a2enmod rewrite
		sudo service apache2 reload
		mysql -e "CREATE DATABASE wordpress;"
		mysql -e "GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER
    -> ON wordpress.*
    -> TO wordpress@localhost
    -> IDENTIFIED BY 'wordpress123';"
		mysql -e "FLUSH PRIVILEGES;"
fi
	

