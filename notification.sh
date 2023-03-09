#!/bin/ash

echo "BEGIN"

bci=$(bitcoin-cli -datadir=/mnt/sda/bitcoin getblockchaininfo)
echo $bci

blocks=$(echo $bci | jq .blocks)
headers=$(echo $bci | jq .headers)
idb=$(echo $bci | jq .initialblockdownload)
bitcoindstatus=""

if idb="true"
then
    percent=$(printf "%d%%" $(($blocks*100/$headers)))
    bitcoindstatus='IBD ${percent}'
else
    bitcoindstatus="RUNNING ${headers}"
fi

echo $bitcoindstatus
if -n $MGR_USER
then 
    echo "send message to $MGR_USER"
    noscl message $MGR_USER "$bitcoindstatus"
fi