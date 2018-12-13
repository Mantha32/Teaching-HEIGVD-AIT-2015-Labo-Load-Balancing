#!/bin/bash
#  wrapper the curl browser comamnd line to simulate refreshing page by client being

TMPFILE="/tmp/firstrequest.txt"

touch $TMPFILE;
cookie=$(curl http://192.168.42.42 -D /dev/stdout | tee $TMPFILE | grep -Po '(?<=(set-cookie: )).*(?=; Path=/)')

tail -n 1 $TMPFILE;
rm $TMPFILE;
echo "";

while true;
    do curl http://192.168.42.42  --cookie "$cookie";
    sleep 1;
    echo"" ; 
    done 
