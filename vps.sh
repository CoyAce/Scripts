#!/usr/bin/expect
# 设置永不超时
set timeout -1
spawn ssh root@coyace.top
expect "*password:"
send "password\r"
# 权限交给控制台
interact
