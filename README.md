# docker-dns-forwarder
DNS forwarder in a Docker container based on alpine:latest, using bind. Container is scheduled to be created every month.

## Usage
```bash
docker pull cultx/dns-forwarder:latest

docker run -d -p 53:53 cultx/dns-forwarder:latest
```

## Environment Variables
The Image uses these Environment Variables:

|Environment Variable|Default value|Purpose|
|---|---|---|
|DNS_LISTEN_ON_ADDRESS|any|Listen on specific ip addressess; "any" means, listen on every ip.|
|DNS_FORWARDERS|1.0.0.1;1.1.1.1;|DNS Servers to use. In Azure you would probably use [168.63.129.16](https://learn.microsoft.com/azure/virtual-network/what-is-ip-address-168-63-129-16).|
