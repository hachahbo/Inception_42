FROM debian:11.7

RUN apt update -y && \
    apt upgrade -y && \
    apt-get install mariadb-server -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run;
# COPY ./conf/*.conf /etc/mysql/mariadb.conf.d/
WORKDIR /
COPY ./tools/*.sh .
RUN chmod 777 ./*.sh
EXPOSE 3306

CMD [ "./script.sh" ]