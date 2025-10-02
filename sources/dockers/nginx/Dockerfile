#set the image
FROM debian:bullseye

#install all dependencies
# '-y'=  without confirmation
# '--no-install-recommends nginx openssl' = to install just necessary paquets to avoid use more memory 
RUN apt update && apt upgrade && apt install -y \ nginx

#copy files & repertories
COPY ./nginx/conf/configuration_file.conf

#port number for container's listening
EXPOSE 443

#modify actual repertory (next cmd will use this new repertory)
WORKDIR 

#container's entrypoint
ENTRYPOINT

#define arguments & commands
#daemon off = nginx is in the first plan
CMD["nginx", "-g", "daemon off;"]

