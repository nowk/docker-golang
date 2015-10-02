FROM phusion/baseimage:0.9.17
MAINTAINER Yung Hwa Kwon <yung.kwon@damncarousel.com>

ENV GOLANG_MAJOR 1.4
ENV GOLANG_VERSION 1.4.3

# install dependencies
RUN apt-get update \
	&& apt-get install -y \
	git \
	gcc

# install go
RUN mkdir -p /opt && cd /opt \
	&& git clone https://github.com/golang/go.git \
	&& cd go \
	&& git checkout go${GOLANG_VERSION}

RUN cd /opt/go/src && ./all.bash

# clean up
RUN rm -rf /opt/go/.git
RUN apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# go directories
RUN mkdir -p /go/src /go/bin && chmod -R 777 /go

# go envs
ONBUILD ENV GOROOT /opt/go
ONBUILD ENV GOPATH /go
ONBUILD ENV PATH $GOROOT/bin:$GOPATH/bin:$PATH

# mount your local go/src
ONBUILD VOLUME /go/src


LABEL \
	version=$GOLANG_VERSION \
	os="linux" \
	arch="amd64"

