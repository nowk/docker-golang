FROM debian:jessie
MAINTAINER Yung Hwa Kwon <yung.kwon@damncarousel.com>

ENV GOLANG_MAJOR 1.5
ENV GOLANG_VERSION 1.5.1

# install dependencies
RUN apt-get update \
	&& apt-get install -y \
	curl \
	git \
	gcc

# FIXME install go
# RUN mkdir -p /opt && cd /opt \
# 	&& git clone https://github.com/golang/go.git \
# 	&& cd go \
# 	&& git checkout go${GOLANG_VERSION}
#
# RUN cd /opt/go/src && ./all.bash

# failing tests during build, particularly https://github.com/golang/go/issues/12412
# On both debian and phusion/baseimage
# installing from binary release
RUN mkdir -p /opt/go && cd /opt \
	&& curl -O https://storage.googleapis.com/golang/go${GOLANG_VERSION}.linux-amd64.tar.gz \
	&& tar -xf go${GOLANG_VERSION}.linux-amd64.tar.gz -C ./go --strip-components 1 \
	&& rm go${GOLANG_VERSION}.linux-amd64.tar.gz

# clean up
RUN rm -rf /opt/go/.git \
	&& apt-get clean \
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

