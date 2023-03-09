#!/bin/ash

bci=$(bitcoin-cli -datadir=/mnt/sda/bitcoin getblockchaininfo)
echo $bci

blocks=$(echo $bci | jq .blocks)
headers=$(echo $bci | jq .headers)
idb=$(echo $bci | jq .initialblockdownload)

if idb
then
    echo "IBD"
else
    echo "RUNNING"
fi