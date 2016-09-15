NAME=golang
VERSION=$(shell cat $(shell readlink -f "./VERSION"))


$.PHONY: go-shared-volume

go-shared-volume:
	docker run -v /go/bin -v /go/pkg --name ${NAME}v$(VERSION) --entrypoint go $(NAME):$(VERSION) version
