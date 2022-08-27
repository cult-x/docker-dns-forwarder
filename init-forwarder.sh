#!/bin/sh

# writing bind config
cat > /etc/bind/named.conf << BindConfigFile
options {
        recursion yes;
        allow-query { any; }; # do not expose externally
        forwarders {
            $DNS_FORWARDERS
        };
        forward only;
        dnssec-validation no; # needed for private dns zones
        auth-nxdomain no; # conform to RFC1035
        listen-on { $DNS_LISTEN_ON port $DNS_PORT };
};
BindConfigFile

# starting bind
/usr/sbin/named -f -g
