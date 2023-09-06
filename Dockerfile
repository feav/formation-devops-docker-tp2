FROM ubuntu:18.04
MAINTAINER armel_embolo (feavfeav@gmail.com)
RUN apt-get update
# Install server nginx
RUN apt-get install -y nginx
# Disable interaction with terminal to automate all 
RUN export DEBIAN_FRONTEND=noninteractive
# Install git and add -y to accept to install automatically
RUN apt-get install -y  git
#Vide le dossier html
RUN rm -R /var/www/html/*
#Cloner le code source directement dans le contenair depuis Github
RUN git clone https://github.com/diranetafen/static-website-example.git  /var/www/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

