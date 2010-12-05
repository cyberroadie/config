#!/bin/sh
wget -q -O - --no-check-certificate --post-data='sub=getaccountdetails_v1&withcookie=1&login=talk2tao&password=$1' https://api.rapidshare.com/cgi-bin/rsapi.cgi | grep cookie | cut -d= -f2 > ~/.rapidshare
