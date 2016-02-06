# nowk/golang 

Golang Docker

---

| Entrypoint | Cmd    |
| ---------- | ------ |
| go         | --help |

## Example

    WORKDIR=$(echo $(pwd) | sed "s#$GOPATH#/go/#")

    docker -run -v ${GOPATH}/src:/go/src -w ${WORKDIR}--rm -t nowk/golang:1.4.3 test ./...

---

Note: Because installed packages and files are not normally within your project's directy (eg. The stuff that is in `$GOPATH/go/bin` and `$GOPATH/go/pkg`), it is advised to create a shared volume to make those dependencies available across your go commands.

    docker run -v /opt/go -v /go/bin -v /go/pkg --name gov1.4.3 nowk/golang:1.4.3

Then use `--volumes-from` to attach it to your run command.

    docker -run --volumes-from gov1.4.3 -v ${GOPATH}/src:/go/src -w ${WORKDIR}--rm -t nowk/golang:1.4.3 test ./...


---

## -base

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
| 1.5.1    |


---

## -onbuild

    FROM nowk/golang-onbuild:<VERSION>

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


*Note: Because of the way golang structures it's fs layout, you must manually switch to your project's working dir within the docker container.*

