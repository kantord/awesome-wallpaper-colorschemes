#!/usr/bin/env bash
token=`cat ./token`
pages=19
mkdir -p ./jsons

for ((i=1;i<=$pages;i++)); 
do 
	curl "https://api.unsplash.com//collections/8638421/photos?client_id=$token&per_page=30&page=$i" > /tmp/unsplash_results.json
	for ((j=0;j<=29;j++)); 
	do 
		id=`cat /tmp/unsplash_results.json | emuto "[\$[0].id]" -o=raw`
		cat /tmp/unsplash_results.json | emuto "\$[0]" > ./jsons/$id.json
	done
done
