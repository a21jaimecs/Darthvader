FROM debian:12

RUN apt update && apt install -y \
    net-tools \
    procps \
    most \
    iproute2 \
    iputils-ping \
    dnsutils \
    bind9 \
    bind9utils \
    bind9-doc
    
RUN apt clean && service bind9 restart && rm -rf /var/lib/apt/lists/*

COPY named.conf.options /etc/bind/named.conf.options

ENTRYPOINT ["named", "-c", "/etc/bind/named.conf", "-g"]



