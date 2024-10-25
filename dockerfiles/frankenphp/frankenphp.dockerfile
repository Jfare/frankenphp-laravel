FROM dunglas/frankenphp:1.2.5-builder-php8.3.12-alpine

ARG WWWUSER
ARG WWWGROUP

ENV DEBIAN_FRONTEND noninteractive
ENV TZ=Europe/Helsinki

# set localtime
RUN apk add --no-cache tzdata \
    && cp /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && apk del tzdata


RUN adduser -D ${WWWUSER}; \
    # Add additional capability to bind to port 80 and 443
    setcap CAP_NET_BIND_SERVICE=+eip /usr/local/bin/frankenphp; \
    # Give write access to /data/caddy and /config/caddy
    chown -R ${WWWUSER}:${WWWUSER} /data/caddy && chown -R ${WWWUSER}:${WWWUSER} /config/caddy

RUN install-php-extensions \
    pdo_pgsql \
    gd \
    intl \
    zip \
    opcache \
    @composer

COPY php.ini /usr/local/etc/php/

RUN mkdir -p /var/www/.composer && \
    chown -R ${WWWUSER}:${WWWUSER} /var/www/.composer

RUN chown -R ${WWWUSER}:${WWWUSER} /app/public

USER ${WWWUSER}
