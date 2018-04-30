#!/bin/bash

if [ $# -ne 2 ]; then
	echo "usage> $0 \"gdoc-url\" filetype"
	echo -e "\tfiletype: txt,html,docx"
	exit -1
fi

baseurl=${1%/edit}
url=$baseurl"/export?format="$2
echo "download url: $url" 1>&2
dl=`curl $url`
echo $dl
