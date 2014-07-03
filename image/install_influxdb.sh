#!/bin/bash

set -o xtrace
cd $WORKDIR # Should be in build dir.

# Setup influxdb on the system
curl -o ./influxdb_latest_amd64.deb \
    http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb
/usr/bin/dpkg -i ./influxdb_latest_amd64.deb

# Install influga from npm package.
/usr/bin/npm install -g influga

cp $WORKDIR/$INFLUXDB_CONF $INFLUXDB_ETC/$INFLUXDB_CONF
chown 999:999 $INFLUXDB_ETC/$INFLUXDB_CONF

cp $WORKDIR/$INFLUGA_CONF $INFLUXDB_ETC/$INFLUGA_CONF
chown 999:999 $INFLUXDB_ETC/$INFLUGA_CONF

exit 0
