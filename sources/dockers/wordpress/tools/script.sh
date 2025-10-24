#!/bin/bash

cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=$DB_NAME --dbuser=$DB_USER_NAME --dbpass=$DB_USER_PASSWORD --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=localhost --title=inception --admin_user=$WP_USER_NAME --admin_password=$WP_USER_PASSWORD --admin_email=$WP_ADMIN_MAIL --allow-root

#exec "$@"

php-fpm7.4 -F

#WP-CLI program to install & manage WP without graphic interface
#WordPress is downloaded
#connexion to dabase configurated
#wordpress installed with a user
#PHP server launch to execute the website
