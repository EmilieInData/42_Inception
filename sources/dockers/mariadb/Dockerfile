#set the image
FROM debian:bullseye

#install all dependencies
RUN apt update && apt upgrade && apt install -y mariadb-server 

#copy files & repertories
COPY ./mariadb/conf/configuration_file.cnf /etc/mysql/mariadb.conf.d/configuration_file.cnf

COPY --chmod=700 ./tools/init.sh /root

#execute the cmd in the image during built process, prepare space to keep files
RUN mkdir -p /run/mysqld && \
    chown mysql:mysql /run/mysqld && \
    chmod 777 /run/mysqld
#test with 750, more safe

#port number for container's listening
EXPOSE 3306

#container's entrypoint
ENTRYPOINT ["/root/init.sh"]

#define arguments & commands
CMD ["mariadb"]

