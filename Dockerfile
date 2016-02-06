FROM nowk/golang-onbuild:1.5.1
MAINTAINER Yung Hwa Kwon <yung.kwon@damncarousel.com>

ENTRYPOINT [ "/opt/go/bin/go" ]
CMD [ "--help" ]

# NOTE these can be volumized along wth the go install directory
#
#    docker run -v /opt/go -v /go/bin -v /go/pkg --name gov${VERSION} \
#        nowk/golang-bin:${VERSION}
# VOLUME /go/bin
# VOLUME /go/pkg
#
# TODO if /go/bin binaries are statically linked they can be mounted and PATH'd
# on local fs to gain access to those binaries.
