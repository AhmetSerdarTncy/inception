FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    mariadb-server \
    && rm -rf /var/lib/apt/lists/*

COPY tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chmod 777 /var/run/mysqld

RUN service mariadb start && \
    mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;" && \
    mysql -e "CREATE USER IF NOT EXISTS 'ahtuncay'@'%' IDENTIFIED BY 'admin_password';" && \
    mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'ahtuncay'@'%';" && \
    mysql -e "FLUSH PRIVILEGES;"

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["/entrypoint.sh"]
CMD ["mysqld"]