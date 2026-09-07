#!/bin/bash
set -e
haproxy -f /etc/haproxy/haproxy.cfg &
tinyproxy -c /etc/tinyproxy/tinyproxy.conf &

if [ ! -f /etc/apt/apt.conf.d/apt-cacher-dt.conf ]; then
    echo 'Acquire::http::Proxy "http://127.0.0.1:3142";' > /etc/apt/apt.conf.d/apt-cacher-dt.conf
    echo 'Dir::Cache "";' >> /etc/apt/apt.conf.d/apt-cacher-dt.conf
    echo 'Dir::Cache::archives "";' >> /etc/apt/apt.conf.d/apt-cacher-dt.conf
fi

exec /docker-entrypoint.sh "$@"
