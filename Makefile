
GOLANG_VERSION=1.5.1

build-docker-base:
	docker build --rm -t nowk/golang-base:${GOLANG_VERSION} .

build-docker-env:
	docker build --rm -t nowk/golang-env:${GOLANG_VERSION} ./env
