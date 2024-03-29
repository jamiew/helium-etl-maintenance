#!/bin/bash
set -e

which=$1
psql="/usr/bin/psql"

if [ -z $which ]; then
  "$0: you must specify 'daily' or 'hourly' to know which tasks to run"
  exit 1
fi

source "$(dirname $0)/etl-env.sh"
cd $ETL_QUERIES
$psql $PGDATABASE < $ETL_QUERIES/crontab-$which.sql
