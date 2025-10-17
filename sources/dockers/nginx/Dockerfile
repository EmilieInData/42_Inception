#set the image
FROM debian:bullseye

#install all dependencies
# '-y'=  without confirmation
# '--no-install-recommends nginx openssl' = to install just necessary paquets to avoid use more memory 
RUN apt update && \
	apt install -y nginx && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*

#copy files & repertories
COPY conf/configuration_file.conf /etc/nginx/conf.d/configuration_file.conf

# #copy initialisation file in the container
# COPY --chmod=700 ./nginx/tools/init.sh /root/

#RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# #port number for container's listening
EXPOSE 443

# #modify actual repertory (next cmd will use this new repertory)
# #WORKDIR 

# #container's entrypoint
# ENTRYPOINT ["root/init.sh"]

#define arguments & commands
#daemon off = nginx is in the first plan
CMD ["nginx", "-g", "daemon off;"]
