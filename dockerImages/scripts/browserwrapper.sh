#!/bin/bash
#  wrapper the curl browser comamnd line to simulate refreshing page

while true;
    do curl http://192.168.42.42  --cookie "$1" -D /dev/stdout;
    sleep 1;
    echo"" ; 
    done
