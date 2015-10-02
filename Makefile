default: build-docker

GOLANG_VERSION=1.4.3

build-docker:
	docker build --rm -t nowk/golang-env:${GOLANG_VERSION} .

