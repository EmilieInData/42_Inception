#set the image
FROM debian:bullseye

#install all dependencies
RUN apt update && \
	apt install -y mariadb-server && \
   	apt clean && \
        rm -rf /var/lib/apt/lists/*

#copy files & repertories
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

#COPY --chmod=700 ./tools/init.sh /root
COPY tools/init.sql /etc/mysql/init.sql
COPY tools/init.sh /tools/init.sh

#execute the cmd in the image during built process, prepare space to keep files
RUN mkdir -p /run/mysqld && \
    chown mysql:mysql /run/mysqld && \
    chmod 755 /run/mysqld && \
    chmod +x /tools/init.sh

#port number for container's listening
EXPOSE 3306

#container's entrypoint
#ENTRYPOINT ["/root/init.sh"]

#define arguments & commands
#CMD ["mariadb"]
#CMD ["mysqld"]
CMD ["tools/init.sh"]
