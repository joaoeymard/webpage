FROM alpine:3.13.2

RUN apk add gettext

ENTRYPOINT /bin/sh -c "( envsubst < /etc/default/joaoeymard.dev.template | tee /project/joaoeymard.dev.conf )"