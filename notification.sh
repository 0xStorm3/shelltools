#!/bin/ash

bci=$(bitcoin-cli -datadir=/mnt/sda/bitcoin getblockchaininfo)
echo $bci

blocks=$(echo $bci | jq .blocks)
headers=$(echo $bci | jq .headers)
idb=$(echo $bci | jq .initialblockdownload)

if idb="true"
then
    echo $(printf "%d%%" $(($blocks*100/$headers)))
    echo 'IBD 11'
else
    echo "RUNNING"
fi
