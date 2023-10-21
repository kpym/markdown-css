#!/bin/sh

normal=$'\e[0m'
red=$'\e[1;31m'
green=$'\e[32m'
yellow=$'\e[33m'

# init test folder
if [ -d "test" ]; then
  rm -rf test/*
else
  mkdir test
fi

# loop over all lines in list.txt file
while read line; do
  echo "${green}Building test for $line${normal}"
  # replace href in <link rel="stylesheet" type="text/css" href="..."> with $line inside test.html
  sd -p '<link(.*?) href="[^"]+"(.*?)>' '<link $1 href="../'$line'.min.css" $2>' test.html > "test/$line.html"
done < list.txt

