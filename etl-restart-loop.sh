#!/bin/bash
while [ 1 ]; do pidof blockchain_etl && (echo 'ok') || (echo 'bad'; ./etl-restart-only.sh); sleep 120; done
