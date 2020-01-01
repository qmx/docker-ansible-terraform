FROM alpine:edge@sha256:2e8c50cbe65693cdf3e6c3822f23ee3e07a7d92fd891d0a5ed9710aedd05ee19

RUN apk add --no-cache ansible terraform="~=0.12.18" openssh git
