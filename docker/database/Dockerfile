FROM mysql:5.6
 
ARG MYSQL_CONTAINER_USER
ARG MYSQL_CONTAINER_GROUP
 
COPY mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

# MySQL ignores the config files with permission 777
RUN chmod 644 /etc/mysql/mysql.conf.d/mysqld.cnf

RUN usermod -u 1000 ${MYSQL_CONTAINER_USER} \
    && groupmod -g 1000 ${MYSQL_CONTAINER_GROUP}
