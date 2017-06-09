#!/bin/bash

isam_ip=$1
file=$2
dest=$3

if [ ! -f ${file} ]; then
    echo "-- file '${file}' does not exist"
    exit -1
fi

echo ">> ${file} -> ${isam_ip}:${dest} ..."
sshpass -p"2x2=4" scp -P2222 ${file} root@${isam_ip}:${dest}
