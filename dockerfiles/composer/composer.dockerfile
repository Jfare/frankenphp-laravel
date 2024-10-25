FROM composer:2

ARG WWWUSER
ARG WWWGROUP

RUN adduser -g ${WWWUSER} -s /bin/sh -D ${WWWUSER}

USER ${WWWUSER}
