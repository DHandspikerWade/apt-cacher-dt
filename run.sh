#!/bin/bash
set -e
haproxy -f /etc/haproxy/haproxy.cfg &

exec /docker-entrypoint.sh "$@"
