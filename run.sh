#!/bin/bash
set -e
haproxy -f /etc/haproxy/haproxy.cfg &
tinyproxy -c /etc/tinyproxy/tinyproxy.conf &

exec /docker-entrypoint.sh "$@"
