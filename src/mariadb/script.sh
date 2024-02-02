#!/bin/bash

service mariadb start

# Wait for MariaDB to be ready (optional, but useful in some cases)
while ! mysqladmin ping -hlocalhost --silent; do
    sleep 1
done

# Check if the database exists
if mariadb -e "SHOW DATABASES LIKE '${WORDPRESS_DB_NAME}'" | grep "${WORDPRESS_DB_NAME}"; then
    echo "Database '${WORDPRESS_DB_NAME}' already exists."
else
    # Create database and user allowing connection from any host
    mariadb -e "CREATE DATABASE ${WORDPRESS_DB_NAME};
                 CREATE USER '${WORDPRESS_DB_USER}'@'%' IDENTIFIED BY '${WORDPRESS_DB_PASSWORD}';
                 GRANT ALL PRIVILEGES ON ${WORDPRESS_DB_NAME}.* TO '${WORDPRESS_DB_USER}'@'%';"
    mariadb -e "FLUSH PRIVILEGES";
    echo "Database '${WORDPRESS_DB_NAME}' created successfully."
fi

sed -i  "s/127.0.0.1/0.0.0.0/g"  /etc/mysql/mariadb.conf.d/50-server.cnf

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld

