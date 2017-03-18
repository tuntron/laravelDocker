#!/bin/bash
APT_DIR="/etc/apt"
VERSION=`awk '{ print $2 }' /etc/issue`

case $VERSION in
    14.04|14.04.1 ) RELEASE="trusty" ;;
    13.04|13.04.1 ) RELEASE="raring" ;;
    13.10 ) RELEASE="saucy" ;;
    12.04|12.04.1|12.04.2|12.04.3|12.04.4|12.04.5 ) RELEASE="precise" ;;
    12.10 ) RELEASE="quantal" ;;
    11.04 ) RELEASE="natty" ;;
    11.10 ) RELEASE="oneiric" ;;
    10.04|10.04.1|10.04.2|10.04.3|10.04.4|10.04.5 ) RELEASE="lucid" ;;
    10.10 ) RELEASE="maverick" ;;
    * ) echo "NOT FOUND RELEASE" |exit 0 ;;
esac

if [ -f $APT_DIR/sources.list ]; then
    cp $APT_DIR/sources.list $APT_DIR/sources.list_bak ||exit 1
else
    echo "sources.list dose not exists.Cant't modify this files"
    exit 0
fi

echo "deb http://mirrors.cloud.aliyuncs.com/ubuntu/ $RELEASE main restricted universe multiverse
deb http://mirrors.cloud.aliyuncs.com/ubuntu/ $RELEASE-security main restricted universe multiverse
deb http://mirrors.cloud.aliyuncs.com/ubuntu/ $RELEASE-updates main restricted universe multiverse
deb http://mirrors.cloud.aliyuncs.com/ubuntu/ $RELEASE-proposed main restricted universe multiverse
deb http://mirrors.cloud.aliyuncs.com/ubuntu/ $RELEASE-backports main restricted universe multiverse
deb-src http://mirrors.cloud.aliyuncs.com/ubuntu/ $RELEASE main restricted universe multiverse
deb-src http://mirrors.cloud.aliyuncs.com/ubuntu/ $RELEASE-security main restricted universe multiverse
deb-src http://mirrors.cloud.aliyuncs.com/ubuntu/ $RELEASE-updates main restricted universe multiverse
deb-src http://mirrors.cloud.aliyuncs.com/ubuntu/ $RELEASE-proposed main restricted universe multiverse
deb-src http://mirrors.cloud.aliyuncs.com/ubuntu/ $RELEASE-backports main restricted universe multiverse" > $APT_DIR/sources.list
echo "Change sources.list sucessfully"