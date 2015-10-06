default: build-docker

GOLANG_VERSION=1.5.1

build-docker:
	docker build --rm -t nowk/golang-env:${GOLANG_VERSION} .

