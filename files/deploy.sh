#!/bin/bash

#2016-10-08 21:51 

hexo_dir="/2T/smb/git/hexo"
ghID=maxchendt

cd $hexo_dir
rm -rf public db.json
hexo generate

cd ..
rm -rf $ghID.github.io
git clone https://github.com/$ghID/$ghID.github.io
cp -R $hexo_dir/public/* $ghID.github.io/

cd $ghID.github.io
git add --all
git commit -m "$1"
git push -u origin master

