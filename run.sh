#!/bin/bash

# set password
echo "hacluster:$PCS_PASS" | chpasswd

# patch etc/hosts
for i in $PCS_NODES; do
    NAME=`echo $i| cut -f1 -d:`
    IP=`echo $i| cut -f2 -d:`
    echo "$IP $NAME" >> /etc/hosts
done

export  GEM_HOME=/usr/lib/pcsd/vendor/bundle/ruby

exec /usr/bin/ruby -I/usr/lib/pcsd /usr/lib/pcsd/ssl.rb

