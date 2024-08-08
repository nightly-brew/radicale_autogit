FROM docker.io/library/python:3.12.5-alpine

ARG RADICALE_VERSION=v3.2.2
ENV RADICALE_VERSION=${RADICALE_VERSION}

RUN mkdir -p "/etc/radicale/auth"
RUN mkdir -p "/var/lib/radicale"

VOLUME "/var/lib/radicale"
VOLUME "/etc/radicale/auth"

COPY "radicale/config"  "/etc/radicale/config"
COPY "radicale/autogit.sh" "/etc/radicale/autogit.sh"

RUN chown root:root "/etc/radicale/autogit.sh"
RUN chmod 755 "/etc/radicale/autogit.sh"

RUN apk add --no-cache ca-certificates openssl \
  && apk add --no-cache curl git \
  && apk add --no-cache --virtual .build-deps gcc libffi-dev musl-dev \
  && pip install --no-cache-dir "Radicale[bcrypt] @ https://github.com/Kozea/Radicale/archive/${RADICALE_VERSION}.tar.gz" \
  && apk del .build-deps

EXPOSE 5232

CMD ["radicale"]