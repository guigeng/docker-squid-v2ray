#!/bin/sh

set -e

sed -i "s/LISTEN_PORT/${LISTEN_PORT}/" ${V2RAY_CONFIG_FILE}
exec /usr/bin/v2ray/v2ray -config ${V2RAY_CONFIG_FILE}
