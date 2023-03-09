#!/bin/ash

bci=$(bitcoin-cli -datadir=/mnt/sda/bitcoin getblockchaininfo)
echo $bci

blocks=$(echo $bci | jq .blocks)
headers=$(echo $bci | jq .headers)
idb=$(echo $bci | jq .initialblockdownload)

if idb="true"
then
    echo 'IBD $(printf "%d%%" $(($blocks*100/$headers)))'
else
    echo "RUNNING"
fi