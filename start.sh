#!/bin/bash

DEFAULT_TEAM="https://gitlab.com/groups/a-esc"

TEAM=(
	$DEFAULT_TEAM
	"https://github.com/asanotigaku"
)

check_url(){
	echo -n "checking "$1"... " 1>&2
	result=`curl $1 -w '%{http_code}\n' -s -o /dev/null`
	if [ 200 != "${result}" ]; then
		echo "error(${result})" 1>&2
		echo "error"
	else
		echo "ok" 1>&2
		echo "ok"
	fi
}

get_repo(){
	for i in "${TEAM[@]}"; do
		result=`check_url $i/$1`
		if [ $result == "ok" ]; then
			echo $i/$1
			return
		fi
	done
	echo "error"
}

make_repo(){
	if [ -d $1 ]; then
		echo "ディレクトリ \"$1\" が存在します．処理を中断します．"
		exit -1
	fi
	mkdir $1
	cd $1
	git init
	repo=$DEFAULT_TEAM"/"$1".git"
	git remote add origin $repo
	echo -n "$repoを作成してください．[Enter]"
	read
	git push -u origin master
}

# check connection
ping google.com -c 1 >> /dev/null
if [ $? != 0 ]; then
	echo "インターネットに接続してください"
	exit -1
fi

echo -n "ホルストの年度(西暦): "
read year
echo $year"年"

title="holst-$year"
repo_url=`get_repo $title`

if [ $repo_url == "error" ]; then
	echo "gitリポジトリが見つかりませんでした．"
	read -p "gitリポジトリを新規に作成しますか？ [Y/n]: " yn
	case $yn in
		[n] ) exit;;
	esac
	make_repo $title
else
	git clone $repo_url
fi
