ARG MYSQL_VERSION_NUMBER

FROM mysql:$MYSQL_VERSION_NUMBER

ARG MYSQL_VERSION_NUMBER
ARG MYSQL_CHARSET
ARG MYSQL_COLLATION

RUN if [ "$MYSQL_VERSION_NUMBER" = "8.0" ] ; then echo "default-authentication-plugin=mysql_native_password" >> /etc/mysql/conf.d/docker.cnf ; fi
# RUN [[ "$MYSQL_VERSION_NUMBER" = "8.0" ]] && echo "default-authentication-plugin=mysql_native_password" >> /etc/mysql/conf.d/docker.cnf

RUN echo "character-set-server=$MYSQL_CHARSET" >> /etc/mysql/conf.d/docker.cnf
RUN echo "collation-server=$MYSQL_COLLATION" >> /etc/mysql/conf.d/docker.cnf