#!/bin/sh
set -e

cat > /etc/squid/peer.conf <<EOF
cache_peer ${PEER_SERVER} parent ${PEER_PORT} 0 no-digest proxy-only
prefer_direct off
nonhierarchical_direct off
acl chinaip dst "/etc/squid/cnip.txt"
always_direct allow chinaip
never_direct allow all
EOF

exec /usr/sbin/squid -f ${SQUID_CONFIG_FILE} 
