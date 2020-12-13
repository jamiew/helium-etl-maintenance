#!/bin/sh
set -e

cd /root/blockchain-etl # for cronjob
git pull -q origin master 
make release
make migrations
make start
