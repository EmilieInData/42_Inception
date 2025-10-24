#set the image
FROM debian:bullseye

#install all dependencies
RUN apt-get update && \
	apt-get install -y --no-install-recommends  mariadb-server && \
        rm -rf /var/lib/apt/lists/*

#copy files & repertories
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/script.sh /tools/script.sh

#execute the cmd in the image during built process, prepare space to keep files
RUN mkdir -p /run/mysqld && \
    chown mysql:mysql /run/mysqld && \
    chmod 755 /run/mysqld && \
    chmod +x /tools/script.sh

#port number for container's listening
EXPOSE 3306

#container's entrypoint
ENTRYPOINT ["/tools/script.sh"]

#define arguments & commands
CMD ["mysqld"]
