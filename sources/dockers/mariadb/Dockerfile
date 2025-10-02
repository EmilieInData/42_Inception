#set the image
FROM debian:bullseye

#install all dependencies
RUN apt update && apt upgrade && apt install -y \ mariadb-server \ mariadb-client 

#copy files & repertories
COPY ./mariadb/conf/configuration_file.conf # + ajouter adresse destination

COPY #+ fichier init

RUN #+ ce que dois faire mariadb

#port number for container's listening
EXPOSE 3306

#container's entrypoint
ENTRYPOINT #+info

#define arguments & commands
#CMD["mariadb"]
CMD["mysqld"]
