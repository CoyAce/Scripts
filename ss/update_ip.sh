#!bin/bash
chmod u+x getip.sh
ip=`./getip.sh`
cat /etc/shadowsocks.json|sed -e "s/\"server\".*/\"server\":\"$ip\"/"> /etc/shadowsocks.json
