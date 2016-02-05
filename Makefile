NAME=nowk/golang
VERSION=1.4.3

default: $(VERSION)

base:
	docker build -f Dockerfile.$@ --rm -t $(NAME)-$@:$(VERSION) .

onbuild: base
	docker build -f Dockerfile.$@ --rm -t $(NAME)-$@:$(VERSION) .

$(VERSION): onbuild
	docker build --rm -t $(NAME):$(VERSION) .


push:
	docker push $(NAME)-base:$(VERSION)
	docker push $(NAME)-onbuild:$(VERSION)
	docker push $(NAME):$(VERSION)

$.PHONY: push

go-shared-volume:
	docker run \
		-v /opt/go -v /go/bin -v /go/pkg --name gov$(VERSION) $(NAME):$(VERSION)
