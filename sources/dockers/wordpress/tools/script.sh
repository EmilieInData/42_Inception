#!/bin/bash

#--> change repertory
cd /var/www/html

#--> download WP-CLI program (install & manage WP without graphic interface)
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

#--> download Wordpress
./wp-cli.phar core download --allow-root

#--> create WP configuration
./wp-cli.phar config create --dbname=$DB_NAME --dbuser=$DB_USER_NAME --dbpass=$DB_USER_PASSWORD --dbhost=mariadb --allow-root

#--> install WP
./wp-cli.phar core install --url=localhost --title=inception --admin_user=$WP_USER_NAME --admin_password=$WP_USER_PASSWORD --admin_email=$WP_ADMIN_MAIL --allow-root

#--> update URL in database
./wp-cli.phar option update siteurl "https://${DOMAIN_NAME}" --allow-root
./wp-cli.phar option update home "https://${DOMAIN_NAME}" --allow-root

#--> throw PHP-FPM to execute WP
php-fpm7.4 -F

