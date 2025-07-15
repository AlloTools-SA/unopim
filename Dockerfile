FROM 285754824804.dkr.ecr.eu-west-3.amazonaws.com/allotools/frankenphp-base:8.3 AS base
LABEL org.opencontainers.image.vendor="Allotools S.A."
LABEL org.opencontainers.image.authors="fabien.zanetti@allotools.com"
ARG USER_ID=1000
ARG GROUP_ID=1000

USER root
RUN apt update

RUN docker-php-ext-install calendar zip
RUN apt install nodejs npm -y
#RUN npm install -g npm

COPY --chmod=755 docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

USER www-data

COPY --link --chown=$USER_ID:$GROUP_ID . .

RUN composer install --no-interaction --no-progress --no-scripts --no-cache --prefer-dist --no-dev
RUN npm install

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD [ "frankenphp", "run", "--config", "/etc/caddy/Caddyfile" ]
