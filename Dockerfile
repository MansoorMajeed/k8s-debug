FROM alpine:3.9

RUN apk update && \
    apk add netcat-openbsd \
            curl \
            tcpdump \
            busybox-extras \
            bash \
            vim \
            git \
            bind-tools

########## Setup GO ############

RUN apk add --no-cache --virtual .build-deps bash gcc musl-dev openssl go
RUN cd /tmp && \
    wget -O go.tgz https://dl.google.com/go/go1.19.3.src.tar.gz && \
    tar -C /usr/local -xzf go.tgz  && \
    rm -f /tmp/go.tgz && \
    cd /usr/local/go/src/ && \
    ./make.bash


# Configure Go
ENV GOROOT /usr/local/go
ENV GOPATH /opt/go
ENV PATH /usr/local/go/bin:$GOPATH/bin:$PATH


WORKDIR $GOPATH
############ End go setup #######

CMD exec /bin/sh -c "trap : TERM INT; (while true; do sleep 1000; done) & wait"

