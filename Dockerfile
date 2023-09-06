FROM ubuntu:18.04
MAINTAINER armel_embolo (feavfeav@gmail.com)
RUN apt-get update
RUN apt-get install -y nginx
EXPOSE 80
ADD static-website-example/ /var/www/html/
CMD ["nginx", "-g", "daemon off;"]
