#!/usr/bin/expect
set timeout -1
spawn ssh root@159.89.142.120
expect "*password:"
send "password\r"
interact
