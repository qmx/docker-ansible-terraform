# install terraform
FROM qmxme/curl as terraform_builder
ARG TARGETARCH
RUN curl -L -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.12.18/terraform_0.12.18_linux_$TARGETARCH.zip
RUN cd /usr/local/bin && unzip /tmp/terraform.zip && chmod 755 /usr/local/bin/terraform

FROM alpine:3.11
RUN apk add --no-cache ansible openssh git socat
# terraform
COPY --from=terraform_builder /usr/local/bin/terraform /usr/local/bin/
ADD ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
