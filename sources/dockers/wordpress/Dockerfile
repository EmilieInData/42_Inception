FROM debian:bullseye

RUN apt update && \
        apt install -y php php-fpm php-mysql curl && \
	mkdir -p /run/php && \
	apt clean && \
        rm -rf /var/lib/apt/lists/*

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/.

WORKDIR /var/www/html

CMD ["php-fpm7.4", "-F"]
