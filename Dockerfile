# use latest apline image
FROM alpine:latest

# install bind and remove cache to keep the image small
RUN apk add --no-cache bind && \
    rm -rf /var/cache/apk/*

# copy default config
COPY named.conf /etc/bind/

# COPY 

# Environment Variables
ENV DNS_LISTEN_ON=any;
ENV DNS_FORWARDERS=1.0.0.1;1.1.1.1;
ENV DNS_PORT=53

# expose dns port 53 on tcp and udp
EXPOSE $DNS_PORT

# start bind
ENTRYPOINT ["/usr/sbin/named", "-f", "-g"]