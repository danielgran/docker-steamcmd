#!/usr/bin/expect

spawn apt install -y steamcmd
expect "*More*"
send "\r"
expect "*terms of the Steam License Agreement?*"
send "2\r"

expect eof