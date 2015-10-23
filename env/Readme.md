# golang-env

Golang Docker enviroment

## Usage

    FROM nowk/golang-env:<VERSION>

---

| Environment Vars |                   |
| ---------------- | ----------------- |
| GOPATH           | /go               |
| PATH             | $GOPATH/bin:$PATH |

| User Info |        |
| --------- | ------ |
| user      | golang |
| uid       | 1001   |
| sudo      | false  |

| Volumes   | Example                  |
| --------- | ------------------------ |
| /go/src   | -v ${GOPATH}/src:/go/src |


## Example

    FROM nowk/golang-env:1.5.1

    USER golang
    WORKDIR /go/src/github.com/name/project

    ---

    docker build --rm -t mygoproject .
    docker run -v $GOPATH/src:/go/src --rm -it mygoproject go test ./...

