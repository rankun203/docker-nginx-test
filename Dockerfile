######################################################################
# Dockerfile to build Nginx Installed Containers
# Based on aliyuncs.com Ubuntu
# https://www.digitalocean.com/community/tutorials/docker-explained-using-dockerfiles-to-automate-building-of-images
######################################################################

FROM registry.mirrors.aliyuncs.com/library/ubuntu:14.04

MAINTAINER rankun203@gmail.com

# Install Nginx and all the stuff
RUN apt-get update
RUN apt-get install -y nano vim git git-man wget dialog net-tools nginx

# Configure Nginx
RUN rm -v /etc/nginx/nginx.conf
ADD nginx.conf /etc/nginx

# Expose ports
EXPOSE 8080

# Default command to execute
service nginx start
