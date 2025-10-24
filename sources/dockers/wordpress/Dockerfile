FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates php php-fpm php-mysql php-phar php-cli curl && \
    mkdir -p /run/php && \
    rm -rf /var/lib/apt/lists/*

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/.

COPY tools/script.sh /tools/script.sh

RUN chmod +x /tools/script.sh

EXPOSE 9000

ENTRYPOINT ["/tools/script.sh"]

#CMD ["php-fpm7.4", "-F"]
