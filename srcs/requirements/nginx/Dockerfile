FROM debian:11

RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get install -y openssl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt -subj "/C=MA/ST=Khouribga/L=Khouribga/O=1337/CN=hachahbo.42.fr"
COPY conf/*.conf  /etc/nginx/sites-enabled/
RUN  chmod 775 /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"] 