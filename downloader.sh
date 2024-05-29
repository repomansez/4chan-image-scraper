#!/bin/sh
test -z $1 || test -z $2 && echo -e "usage: downloader.sh directory link\ne.g downloader.sh hentai https://4chan.org/d/6969" && exit

mkdir -p $1
python scrape.py $2 > "$1/links"
cd $1
wget -nc -i links

echo done!