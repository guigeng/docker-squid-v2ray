#!/bin/bash
while read ipaddr; do
arr=(${ipaddr//./ })
mac_file=/etc/squid/mac/mac.txt
index=`snmpwalk -v2c -c public 10.222.2.251 IP-MIB::ipAdEntIfIndex.${arr[0]}.${arr[1]}.${arr[2]}.250|awk '{print $4}'`
mac=`snmpwalk -v2c -c public -O 0 10.222.2.251 IP-MIB::ipNetToMediaPhysAddress.${index}.${ipaddr} | awk '{print $4}'`
result=`grep -i $mac ${mac_file}|wc -l`
if [ $result -ge "1" ];then
    echo "OK"
else
    echo "ERR"
fi
done
