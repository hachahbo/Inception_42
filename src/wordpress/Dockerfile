FROM debian:11


RUN apt update -y && \
    apt upgrade -y && \
    apt-get -y install wget php-fpm php-mysql mariadb-client curl 

WORKDIR /var/www/html

COPY *.sh .

RUN  chmod 777 ./setup_env.sh

EXPOSE 9000

# CMD ["tail","-f","/dev/null"]
CMD ["sh", "/var/www/html/setup_env.sh"]