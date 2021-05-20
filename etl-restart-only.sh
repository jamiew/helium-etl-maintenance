#!/bin/sh

source "$(dirname $0)/etl-env.sh"
cd $ETL_DIRECTORY # for cronjob-compatibility

make stop
make start
