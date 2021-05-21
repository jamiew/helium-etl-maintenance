#!/bin/sh

which=$1
psql="/usr/bin/psql"

if [ -z $which ]; then
  "$0: you must specify 'daily' or 'hourly' to know which tasks to run"
  exit 1
fi

source "$(dirname $0)/etl-env.sh"
$psql etl < $ETL_QUERIES/crontab-$which.sql
