#!/bin/bash
trackers=`wget -qO- https://trackerslist.com/best_aria2.txt`
nohup aria2c --conf-path /etc/aria2.conf --bt-tracker=$trackers &
