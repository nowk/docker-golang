
GOLANG_VERSION=1.5.1

default: build-all


build-docker-base:
	docker build \
		-f Dockerfile.base \
		--rm -t nowk/golang-base:${GOLANG_VERSION} .


build-docker-env:
	docker build \
		-f Dockerfile.env \
		--rm -t nowk/golang-env:${GOLANG_VERSION} .


build-all: build-docker-base build-docker-env

