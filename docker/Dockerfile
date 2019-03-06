FROM alpine:3.9

RUN apk update && \
    apk add netcat-openbsd \
            curl \
            tcpdump \
            busybox-extras \
            bash

CMD exec /bin/sh -c "trap : TERM INT; (while true; do sleep 1000; done) & wait"

