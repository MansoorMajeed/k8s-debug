FROM alpine:3.9

RUN apk update && \
    apk add netcat-openbsd \
            curl \
            tcpdump \
            busybox-extras \
            bash \
            vim

########## Setup GO ############
RUN apk add --no-cache git make musl-dev go

# Configure Go
ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH

RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin

# Install Glide
RUN go get -u github.com/Masterminds/glide/...

WORKDIR $GOPATH
############ End go setup #######

CMD exec /bin/sh -c "trap : TERM INT; (while true; do sleep 1000; done) & wait"

