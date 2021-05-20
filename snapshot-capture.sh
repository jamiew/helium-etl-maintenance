#!/bin/bash
set -e

source "$(dirname $0)/etl-env.sh"
etl="$ETL_DIRECTORY/_build/dev/rel/blockchain_etl/bin/blockchain_etl"
echo "etl=$etl"

outdir="$SNAPSHOTS_DIR"
mkdir -p "$outdir"

height=$($etl info height | awk '{ print $2 }')
outfile="$outdir/snapshot-$height.bin"

if [ -e "$outfile" ]; then
  echo "$0: error, outfile $outfile already exists. aborting"
  exit 1
fi

echo "Pausing sync..."
$etl repair sync_pause
echo "Taking snapshot => $outfile ..."
$etl snapshot take "$outfile"
echo "Resuming sync..."
$etl repair sync_resume
echo "All done"
