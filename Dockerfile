FROM alpine:3.13.2

WORKDIR /build/

COPY --chown=997:993 assets/ /build/assets/
COPY --chown=997:993 css/ /build/css/
COPY --chown=997:993 js/ /build/js/
COPY --chown=997:993 lib/ /build/lib/
COPY --chown=997:993 index.html /build/


ENTRYPOINT rsync -prog /build/* /project/