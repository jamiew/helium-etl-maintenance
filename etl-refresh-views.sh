#!/bin/sh

source "$(dirname $0)/etl-env.sh"
/usr/bin/psql etl < $ETL_QUERIES/crontab.sql
