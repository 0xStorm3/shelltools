#!/bin/ash

blockchaininfo = $(bitcoin-cli -datadir=/mnt/sda/bitcoin getblockchaininfo)

echo ${blockchaininfo}