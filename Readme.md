# golang-env

Golang Docker environment

## Usage

    FROM nowk/golang-env:<VERSION>

---

| Environment Vars |                     |
| ------ | ----------------------------- |
| GOROOT | /opt/go                       |
| GOPATH | /go                           |
| PATH   | $GOROOT/bin:$GOPATH/bin:$PATH |

---

| Versions |
| -------- |
| 1.4.3    |

## Example

    FROM nowk/golang-env:1.4.3

    WORKDIR /go/src/github.com/name/project

    ---

    docker build --rm -t mygoproject .
    docker run -v $GOPATH/src:/go/src --rm -it mygoproject go test ./...

