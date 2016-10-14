#!/bin/bash

#2016-10-14 08:37 
#2016-10-14 10:18 升级
# 初始化 hexo-dir， 初始化 架构设置，初始 主题设置

cwd=`pwd`

if [ -d ./hexo ]; then
	echo 'hexo dir exist'
	exit
fi


hexo init ./hexo
cd hexo
git clone https://github.com/iissnan/hexo-theme-next themes/next

npm install hexo-generator-sitemap --save
npm un hexo-renderer-marked --save
npm install hexo-renderer-pandoc --save

# HexoSite.tar.xz 解压到 ./fix/ 下
cd $cwd/fix/HexoSite
./HexoSite.sh $cwd/hexo next

# HexoNext.tar.xz 解压到 ./fix/ 下
cd $cwd/fix/HexoNext
./fixNext.sh $cwd/hexo/themes/next

