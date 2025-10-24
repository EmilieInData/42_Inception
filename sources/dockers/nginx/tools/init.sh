#!/bin/bash

if [ -f /var/www/html/ssl/selfsigned.key ]; then
    echo "SSL certificate and key already exist, nothing to generate"
    
else
    echo "Generating SSL certificate and key"
    mkdir -p /var/www/html/ssl
    openssl req -x509 -newkey rsa:4096 -days 365 -nodes \
	    	      -keyout /var/www/html/ssl/selfsigned.key \
		      -out /var/www/html/ssl/selfsigned.crt \
		      -subj "/CN=localhost"
fi

echo "Starting nginx..."

exec "$@"

#nginx -g "daemon off;"
