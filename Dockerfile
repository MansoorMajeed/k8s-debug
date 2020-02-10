FROM alpine:3.9

RUN apk update && \
    apk add netcat-openbsd \
            curl \
            tcpdump \
            busybox-extras \
            bash \
            vim \
            git

########## Setup GO ############
ADD https://dl.google.com/go/go1.13.7.linux-amd64.tar.gz /tmp/
RUN tar xf /tmp/go1.13.7.linux-amd64.tar.gz && mv /tmp/go /usr/local/go
# Configure Go
ENV GOROOT /usr/local/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH

RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin



WORKDIR $GOPATH
############ End go setup #######

CMD exec /bin/sh -c "trap : TERM INT; (while true; do sleep 1000; done) & wait"

