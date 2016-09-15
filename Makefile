NAME=nowk/golang
VERSION=$(shell cat $(shell readlink -f "./VERSION"))


$.PHONY: go-shared-volume

go-shared-volume:
	docker run \
		-v /opt/go -v /go/bin -v /go/pkg \
		--name gov$(VERSION) $(NAME):$(VERSION) version
