

FROM ubuntu:latest



RUN apt update -y
RUN apt install bind9 dnsutils -y
RUN apt install apache2 net-tools -y

COPY named.conf.local /etc/bind
COPY web.asa.br /etc/bind
COPY index.html /var/www/html/
EXPOSE 80/tcp
EXPOSE 80/udp



CMD ["/usr/sbin/named","-g","-c","/etc/bind/named.conf","-u","bind"]
#ou
#ENTRYPOINT [ "executable" ]






#docker build -t ubuntu-bind .
#docker run -d --name bind ubuntu-bind
#docker exec -it bind bash
