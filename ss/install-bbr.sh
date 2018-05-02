#!/bin/bash
yum install wget
wget –no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh
chmod +x bbr.sh
./bbr.sh
# remove kernel
# rpm -qa|grep kernel
# yum remove kernel_name
