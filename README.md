# golang 

Golang executables through Docker

## Install

Add the contents of `bin` to your `$PATH`.


## Setup

To setup a "global" golang environment:

    $ cd /path/to/this/docker-golang
    $ docker-golang-init

This will create a `.golang` file with the `GOLANG_VERSION` and the Docker ID
to the shared volume as `GOLANG_VOLUMES_FROM`. As well as creating the
necessary shared Docker volume.

    GOLANG_VERSION=1.7.5
    GOLANG_VOLUMES_FROM=f96cbc42b077a3232e6f233d5eb45e26383c90fcf75273129b4102c8a168044f

---

To create a project specific `.golang` you will need to have a `golang` service
in your `docker-compose.yml`.

    # docker-compose.yml
    golang:
      image: "golang:1.7.5"
      volumes:
        - /go/bin
        - /go/pkg

You can then run the `docker-golang-init` command within your project to create
a `.golang` file within your project directory.


## TODO

- [ ] Wrappers for `vim-go` binaries (Installed via `:GoInstallBinaries`)

- [ ] Support for `vim-go` `:GoTest` being running in sub-directories to use
  the project `.golang`.

- [ ] Parsing the `VERSION` from your project's `docker-compose.yml`


## License

MIT

