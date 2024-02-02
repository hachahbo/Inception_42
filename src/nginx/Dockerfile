FROM debian:11


RUN apt-get update

RUN apt-get install -y nginx
RUN apt-get install -y openssl
RUN mkdir -p /etc/nginx/ssl
RUN mkdir -p /var/www/html/page_2
RUN mkdir -p /var/www/html/page_1
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt -subj "/C=MA/ST=State/L=City/O=Organization/CN=localhost"
COPY conf/*.conf  /etc/nginx/sites-enabled/
COPY conf/page_1/*.html  /var/www/html/page_1
COPY conf/page_1/*.png  /var/www/html/page_1
COPY conf/page_1/*.svg  /var/www/html/page_1
COPY conf/page_2/*.html  /var/www/html/page_2
COPY conf/page_2/*.png  /var/www/html/page_2
COPY conf/page_2/*.svg  /var/www/html/page_2
RUN  chmod 775 /var/www/html


EXPOSE 443


CMD ["nginx", "-g", "daemon off;"]
