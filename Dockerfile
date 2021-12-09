FROM alpine:3.13.2

WORKDIR /build/

COPY --chown=997:993 assets/ /build/assets/
COPY --chown=997:993 css/ /build/css/
COPY --chown=997:993 js/ /build/js/
COPY --chown=997:993 lib/ /build/lib/
COPY --chown=997:993 index.html /build/
COPY --chown=997:993 minhalocalizacao.html /build/

RUN find /build/ -type f -exec chmod 0440 {} \; && \
    find /build/ -type d -exec chmod 0110 {} \;

ENTRYPOINT cp -arf /build/* /project/
