FROM mysql:8



ENV MYSQL_ROOT_PASSWORD=rootpwd
ENV MYSQL_USER=user
ENV MYSQL_PASSWORD=userpwd



#### MYSQL PRE OPERATIONS
# Create the file
RUN touch /docker-entrypoint-initdb.d/dump.sql

# Fill the file
RUN echo 'CREATE DATABASE IF NOT EXISTS service_accounts;' > /docker-entrypoint-initdb.d/init.sql && \
    echo 'CREATE DATABASE IF NOT EXISTS service_adaptative;' > /docker-entrypoint-initdb.d/init.sql && \
    echo 'GRANT USAGE ON *.* TO `$MYSQL_USER`@`%`;' > /docker-entrypoint-initdb.d/init.sql && \
    echo 'GRANT ALL PRIVILEGES ON `service_`*.* TO `$MYSQL_USER`@`%`;' > /docker-entrypoint-initdb.d/init.sql && \
    echo 'FLUSH PRIVILEGES;' > /docker-entrypoint-initdb.d/init.sql

            

#COPY docker-files/dump.sql /docker-entrypoint-initdb.d/dump.sql



#### FINAL OPERATIONS
EXPOSE 3306