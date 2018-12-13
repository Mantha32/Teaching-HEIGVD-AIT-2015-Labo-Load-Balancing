#!/bin/bash
#  run cluster client curl in docker container to simule some client with distinct IP address

docker rm $(docker ps -a -q)


echo "Create 10 client curl to simulate client with distinct IP";

for i in {1..10}
do
docker run -d --name ait-client$i browser-curl
done

echo "Running client"
docker ps

echo "--------------";
echo "ip address for each machine"

for i in {1..10}
do  
echo "Ip address of ait-client$i";
docker inspect --format '{{ .NetworkSettings.IPAddress }}' ait-client$i
echo "";
done

sleep 20;

echo"";

docker stop $(docker ps -a -q)
