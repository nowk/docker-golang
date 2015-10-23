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

