#!/bin/sh
set -e

cd /root/blockchain-etl # for cronjob
latest=$(cat LATEST_BUILD)
echo "LATEST_BUILD: $latest"
echo "Existing HEAD: $(git rev-parse HEAD)"
git pull -q origin master 
head=$(git rev-parse HEAD)
echo "Post-pull HEAD: $head"

if [ "$head" != "$latest" ]; then
  echo "New commits, rebuilding and restarting..."
  make release
  git rev-parse HEAD > LATEST_BUILD
  make migrations
  make start
else
  echo "Commit hashes are the same, not doing anything"
fi
