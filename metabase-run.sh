#!/bin/sh
#
# setup a postgres user and configure below
# also expects a $HOME/metabase dir for datafiles, and uses host networking
# 

docker pull metabase/metabase
docker rm -f metabase 
# docker run -d -p 3000:3000 --name metabase --net=host metabase/metabase
docker run -d \
  -v $HOME/metabase:/metabase-data \
  -e "MB_DB_FILE=/metabase-data/metabase.db" \
  -e "JAVA_TIMEZONE=US/Eastern" \
  -e "MB_DB_TYPE=postgres" \
  -e "MB_DB_DBNAME=metabase" \
  -e "MB_DB_PORT=5432" \
  -e "MB_DB_USER=xxxxxx" \
  -e "MB_DB_PASS=xxxxxxxxxxxxxxxxxxxxxxxxxx" \
  --name metabase \
  --net=host \
  --restart=always \
  metabase/metabase
