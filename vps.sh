#!/usr/bin/expect
set timeout -1
spawn ssh root@coyace.top
expect "*password:"
send "password\r"
interact
