FROM alpine:3.13.2

WORKDIR /build/

COPY --chown=1000:993 assets/ /build/assets/
COPY --chown=1000:993 css/ /build/css/
COPY --chown=1000:993 js/ /build/js/
COPY --chown=1000:993 lib/ /build/lib/
COPY --chown=1000:993 index.html /build/


ENTRYPOINT cp -rf /build/* /project/