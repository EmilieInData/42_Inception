FROM debian:bullseye

RUN apt update && \
        apt install -y php php-fpm php-mysqli curl && \
	mkdir -p /run/php && \
	apt clean && \
        rm -rf /var/lib/apt/lists/*

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/.

COPY tools/script.sh /root/script.sh

RUN chmod +x /root/script.sh

EXPOSE 9000

ENTRYPOINT ["/root/script.sh"]
CMD ["php-fpm7.4", "-F"]
