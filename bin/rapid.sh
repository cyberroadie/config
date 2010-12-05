#!/bin/sh
#wget -c --load-cookies ~/.cookies/rapidshare $1
#curl -L -O --cookie ~/.cookies/rapidshare $1
wget --header="Cookie: enc=`cat ~/.rapidshare`" $1
