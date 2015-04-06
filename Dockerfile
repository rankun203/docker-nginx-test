######################################################################
# Dockerfile to build Nginx Installed Containers
# Based on aliyuncs.com Ubuntu
# https://www.digitalocean.com/community/tutorials/docker-explained-using-dockerfiles-to-automate-building-of-images
# docker build -t "nginx_img_1" ./ && docker run -i -t -p 8088:80 nginx_img_1
######################################################################

FROM ubuntu:14.04

MAINTAINER rankun203@gmail.com

# Configure Apt sources
RUN mv /etc/apt/sources.list /etc/apt/sources.list.old
ADD sources.list /etc/apt/

# Install Nginx and all the stuff
RUN apt-get update
RUN apt-get install -y git nginx

# Configure Nginx
RUN rm -rfv /etc/nginx/sites-available/*
ADD sites-available/ /etc/nginx/sites-available/
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Expose ports
EXPOSE 80

# Default command to execute
CMD service nginx start
