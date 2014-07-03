#!/bin/bash

set -o xtrace
cd $WORKDIR # Should be in build dir.

# Setup influxdb on the system
curl -o ./influxdb_latest_amd64.deb \
    http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb
/usr/bin/dpkg -i ./influxdb_latest_amd64.deb

cp $WORKDIR/$INFLUXDB_CONF $INFLUXDB_ETC/$INFLUXDB_CONF
chown 999:999 $INFLUXDB_ETC/$INFLUXDB_CONF

# Install necessary bits for influga and copy config file.
/usr/bin/add-apt-repository ppa:chris-lea/node.js -y
/usr/bin/apt-get install nodejs -y
/usr/bin/npm install -g influga

cp $WORKDIR/$INFLUGA_CONF $INFLUXDB_ETC/$INFLUGA_CONF
chown 999:999 $INFLUXDB_ETC/$INFLUGA_CONF

exit 0
