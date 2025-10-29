#set the image
FROM debian:bullseye

#install all dependencies
# '-y'=  without confirmation
# '--no-install-recommends nginx openssl' = to install just necessary paquets to avoid use more memory 
RUN apt-get update && \
    apt-get install -y --no-install-recommends nginx openssl && \
    rm -rf /var/lib/apt/lists/*

#copy files & repertories
COPY conf/configuration_file.conf /etc/nginx/conf.d/configuration_file.conf

#copy initialisation file in the container
COPY tools/init.sh /tools/init.sh
RUN chmod +x /tools/init.sh

#port number for container's listening
EXPOSE 443

#container's entrypoint
ENTRYPOINT ["tools/init.sh"]

#define arguments & commands
#daemon off = nginx is in the first plan
CMD ["nginx", "-g", "daemon off;"]
