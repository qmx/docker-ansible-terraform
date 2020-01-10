# docker-ansible-terraform

ansible and terraform conveniently packaged for armv7 and amd64

### ssh agent forwarding

expose the `SSH_AUTH_SOCK` socket on localhost:

```
socat TCP-LISTEN:<port>,reuseaddr,fork UNIX-CLIENT:${SSH_AUTH_SOCK}
```

then run the container:

```
docker run --rm -it --net=host -e FORWARD_SSH=yes -e FORWARD_PORT=<port> -v `pwd`:/work -w /work -u "$(id -u)" qmxme/ansible-terraform:latest sh
```
