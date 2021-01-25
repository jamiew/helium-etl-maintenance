#!/bin/bash
while [ 1 ]; do 
  date
  pidof blockchain_etl && (echo 'ok') || (echo 'bad'; ./etl-restart-only.sh)
  sleep 60
done
