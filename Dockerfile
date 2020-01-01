FROM alpine:edge

RUN apk add --no-cache ansible terraform="~=0.12.18" openssh git
