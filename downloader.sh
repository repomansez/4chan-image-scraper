#!/bin/sh
interactive(){
  echo -e "directory name: "
  read "dir"
  echo -e "thread link: "
  read "link"

  mkdir "$dir" || echo "directory exists, exiting"; exit

  /usr/bin/env python scrape.py "$link" > "$dir/links"
  cd "$dir"
  wget -nc -i links

  echo done!
}

direct(){
  mkdir "$1" || echo "directory exists, exiting"; exit
  /usr/bin/env python scrape.py "$2" > "$1/links"
  cd "$1"
  wget -nc -i links

  echo done!
}

if [ $(id -u) == '0' ]; then
	echo "Don't run random scripts from the internet with root you dingus"
	exit
fi

if [ -z $1 ]; then
  interactive
else
  test -z $1 || test -z $2 && echo -e "usage: downloader.sh directory link\ne.g downloader.sh hentai https://4chan.org/d/6969\nor add no arguments for interactive mode" && exit
  direct "$1" "$2"
fi
