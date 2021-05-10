#!/bin/bash

etl="/root/blockchain-etl/_build/dev/rel/blockchain_etl/bin/blockchain_etl"
echo "etl => $etl"

outdir="/root/snapshots"
mkdir -p "$outdir"

echo "Pausing sync..."
$etl repair sync_pause
height=$($etl info height | awk '{ print $2 }')
outfile="$outdir/snapshot-$height.bin"
echo "Taking snapshot => $outfile ..."
$etl snapshot take "$outfile"
echo "Resuming sync..."
$etl repair sync_resume
echo "All done"
