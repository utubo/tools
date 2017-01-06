#!/bin/bash

URL=$1
OUTFILE=$2

if [ $# -ne 2 ]; then
	echo "Usage: cert-update.sh <url:port> <outfile>"
	echo "	url:port : example) hoge.com:443"
	echo "	outfile  : example) hoge.crt"
	exit 1
fi

if [ -f "$OUTFILE" ]; then
	# debian: date -d=
	# centos: date -v
	EXPIRE=`date --date="$(openssl x509 -noout -enddate -in $OUTFILE | cut -d= -f 2)" +%Y%m%d`
	NOW=`date +%Y%m%d`
	if [ "$NOW" -lt "$EXPIRE" ]; then exit; fi
fi

echo | openssl s_client -connect $URL -showcerts > $OUTFILE

