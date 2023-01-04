FROM mysql

ENV LANG=C.UTF-8

COPY ./SQL/ /docker-entrypoint-initdb.d/