FROM ubuntu:latest as builder

RUN apt-get update
RUN apt-get install curl -y
RUN curl -L -o /tmp/go.sh https://install.direct/go.sh
RUN chmod +x /tmp/go.sh
RUN /tmp/go.sh

FROM alpine:latest

COPY --from=builder /usr/bin/v2ray/v2ray /usr/bin/v2ray/
COPY --from=builder /usr/bin/v2ray/v2ctl /usr/bin/v2ray/
COPY --from=builder /usr/bin/v2ray/geoip.dat /usr/bin/v2ray/
COPY --from=builder /usr/bin/v2ray/geosite.dat /usr/bin/v2ray/
COPY config.json /etc/v2ray/
COPY entrypoint.sh /usr/bin/v2ray/

RUN set -ex \
    && apk --no-cache add ca-certificates \
    && mkdir /var/log/v2ray/ \
	&& chmod +x /usr/bin/v2ray/v2ctl \
    && chmod +x /usr/bin/v2ray/v2ray \
	&& chmod +x /usr/bin/v2ray/entrypoint.sh

ENV PATH="/usr/bin/v2ray:$PATH" \
    V2RAY_CONFIG_FILE="/etc/v2ray/config.json"
EXPOSE 1080/tcp

VOLUME /etc/v2ray

ENTRYPOINT ["entrypoint.sh"]
