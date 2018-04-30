#!/bin/bash

raw=""
if [ $# -gt 1 ]; then
	echo "usage> $0 target.html"
	exit -1
fi
if [ -p /dev/stdin ]; then
	echo "pipe"
	raw=`cat -`
else
	if [ $# -eq 0 ]; then
		exit -1
	fi
	raw=`cat $1`
fi

tmp=${raw%%</style*}
css=${tmp#*<style type=\"text/css\">}
echo $css
