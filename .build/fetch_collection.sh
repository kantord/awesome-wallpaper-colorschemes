#!/usr/bin/env bash
token=`cat ./token`
pages=19
mkdir -p ./jsons

for ((i=1;i<=$pages;i++)); 
do 
	curl "https://api.unsplash.com//collections/8638421/photos?client_id=$token&per_page=30&page=$i" > /tmp/unsplash_results.json
	for ((j=0;j<=29;j++)); 
	do 
		extract_id="[\$[$j].id]"
		id=`cat /tmp/unsplash_results.json | emuto $extract_id -o=raw`
		extract_json="\$[$j]"
		if [ ! -f ./jsons/$id.json ]; then
			cat /tmp/unsplash_results.json | emuto $extract_json  > ./jsons/$id.json
		fi
		make ./full_images/$id.jpeg
	done
done
