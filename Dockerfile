# use latest apline image
FROM alpine:latest

# install bind and remove cache to keep the image small
RUN apk add --no-cache bind && \
    rm -rf /var/cache/apk/*

# copy default config
COPY named.conf /etc/bind/

# expose dns port 53 on tcp and udp
EXPOSE 53

# start bind
ENTRYPOINT ["/usr/sbin/named", "-f", "-g"]
