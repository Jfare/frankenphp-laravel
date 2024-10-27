FROM composer:latest

ARG WWWUSER
ARG WWWGROUP

RUN adduser -g ${WWWUSER} -s /bin/sh -D ${WWWUSER}

USER ${WWWUSER}
