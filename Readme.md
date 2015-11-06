# golang-base

Golang Docker Base Image

## Usage

    FROM nowk/golang-base:<VERSION>

---

| Environment Vars |                   |
| ---------------- | ----------------- |
| GOROOT           | /opt/go           |
| PATH             | $GOROOT/bin:$PATH |

---

| Versions |
| -------- |
| 1.4.3    |
| 1.5.1\*  |

\**1.5.1 build uses the binary release for installation due to tests failures during the source build.*

---

# golang-env

Golang Docker enviroment

## Usage

    FROM nowk/golang-env:<VERSION>

---

| Environment Vars |                   |
| ---------------- | ----------------- |
| GOPATH           | /go               |
| PATH             | $GOPATH/bin:$PATH |

| User   | UID  | SUDO  |
| ------ | ---- | ----- |
| golang | 1000 | false |

*Switching `USER` must be explicitly called.*

| Volumes   | Example                  |
| --------- | ------------------------ |
| /go/src   | -v ${GOPATH}/src:/go/src |


## Example

    FROM nowk/golang-env:1.5.1

    # must explicitly set USER yourself
    USER golang

    WORKDIR /go/src/github.com/name/project

    ---

    docker build --rm -t mygoproject .
    docker run -v $GOPATH/src:/go/src --rm -it mygoproject go test ./...
