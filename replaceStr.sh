#!/bin/bash

if [[ $1 && $2 && $3 ]];then
  ######
    files=`find -type f -regex .*/[^/]*$1[^/]*`
    count=0
    for file in $files
      do
	grep -r $2 $file
	if [ $? == 0 ];then
	  count=$((count+1))
	  echo -e "FILE: $file"
	  sed -i "s/$2/$3/g" $file
	fi
      done
    echo -e "\n\t  DONE: $count FILES !!"
  ######
else
  ######
    echo -e '\t'Welcome to use this SHELL to replace String !!
    echo -e '\t'Warning: if u wanna match .txt, pls input '\\''\\'.txt
    echo -e ''
    echo -e '\t'Usage:'\t'$0 [partOfFileName] [findStr] [replaceStr]
  ######
fi
