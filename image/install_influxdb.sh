#!/bin/bash

set -o xtrace
cd $WORKDIR # Should be in build dir.

# Setup influxdb on the system
curl -o ./influxdb_latest_amd64.deb \
    http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb
/usr/bin/dpkg -i ./influxdb_latest_amd64.deb

cp $WORKDIR/$I_CONF $I_ETC/$I_CONF
chown 999:999 $I_ETC/$I_CONF

exit 0