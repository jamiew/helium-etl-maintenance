#!/bin/bash
set -e 

cd blockchain-etl
./update-and-restart.sh
pidof blockchain-etl || echo "blockchain-etl not running?!"

sleep 2

cd ../blockchain-http
git pull origin master
make release
make stop
sleep 2
make start
sleep 2
curl localhost:8080/v1/blocks | jq
