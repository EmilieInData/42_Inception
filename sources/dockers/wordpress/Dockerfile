FROM debian:bullseye

RUN apt update && \
        apt install -y php php-fpm php-mysql curl && \
	mkdir -p /run/php && \
	apt clean && \
        rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

CMD ["php-fpm7.4", "-F"]
