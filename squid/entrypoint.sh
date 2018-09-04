#!/bin/sh
set -e

echo "
cache_peer ${PEER_SERVER} parent ${PEER_PORT} 0 no-digest proxy-only
prefer_direct off
nonhierarchical_direct off
acl chinaip dst '/etc/squid/cnip.txt'
always_direct allow chinaip
never_direct allow all
" > /etc/squid/peer.conf

exec /usr/sbin/squid -f ${SQUID_CONFIG_FILE} --foreground -NYCd 1
