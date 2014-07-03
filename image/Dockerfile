FROM ubuntu:14.04
MAINTAINER Sam Zaydel <szaydel@gmail.com>

EXPOSE 22 2003 8083 8086 8089 8090 8099

ENV HOME /root
ENV WORKDIR /build
ENV INFLUXDB_CONF config.toml
ENV INFLUGA_CONF influga-config.json
ENV INFLUXDB_ETC /opt/influxdb/shared
RUN mkdir /build
ADD . /build

# Need pubkey copied to root's authorized_keys
RUN mkdir $HOME/.ssh && \
  chmod 700 $HOME/.ssh && \
  cat /build/id_rsa.pub >> $HOME/.ssh/authorized_keys && \
  chmod 440 $HOME/.ssh/authorized_keys  # Will be cleaned-up later

RUN /build/prepare.sh && \
    /build/install_influxdb.sh && \
    /build/system_services.sh && \
    /build/utilities.sh && \
    /build/cleanup.sh

CMD ["/sbin/my_init"]
