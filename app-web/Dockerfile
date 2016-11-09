FROM alpine:3.4
MAINTAINER Abiola Ibrahim <abiola89@gmail.com>
MAINTAINER Diego Silva <diegosiuniube@gmail.com>

LABEL caddy_version="0.9.3" architecture="amd64"

ARG plugins=git

RUN apk add --no-cache openssh-client git tar curl

RUN curl --silent --show-error --fail --location \
      --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
      "https://caddyserver.com/download/build?os=linux&arch=amd64&features=${plugins}" \
    | tar --no-same-owner -C /usr/bin/ -xz caddy \
 && chmod 0755 /usr/bin/caddy \
 && /usr/bin/caddy -version

EXPOSE 3000/tcp
VOLUME /root/.caddy
WORKDIR /srv

COPY Caddyfile /etc/Caddyfile
COPY dist/ /srv/
RUN touch /srv/endpoints.json
COPY entry_point.sh /usr/bin/entry_point.sh

ENTRYPOINT ["/usr/bin/entry_point.sh"]
CMD ["--conf", "/etc/Caddyfile", "--log", "stdout"]