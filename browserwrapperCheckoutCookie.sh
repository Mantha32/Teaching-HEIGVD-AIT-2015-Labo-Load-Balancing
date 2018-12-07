#!/bin/bash
#  wrapper the curl browser comamnd line to simulate refreshing page

TMPFILE="/tmp/firstrequest.txt"

touch $TMPFILE;
echo "First connexion with the load balancer HAProxy"
cookie=$(curl http://192.168.42.42 -D /dev/stdout | tee $TMPFILE | grep -Po '(?<=(set-cookie: )).*(?=; Path=/)')
echo "Checkout the header response"
more $TMPFILE;
rm $TMPFILE;
echo "";
 
echo "Hihglight the cookie value";
echo $cookie;
echo;

echo "---------------------------------"
echo "Refresh the request using the late cookie and checkout the header " ;
curl http://192.168.42.42  --cookie "$cookie" -D /dev/stdout;
echo;

echo;
echo "---------------------------------"
echo "Refresh the request to checkout the loadbalancer policies";
while true;
    do curl http://192.168.42.42  --cookie "$cookie";
    sleep 1;
    echo"" ; 
    done 

