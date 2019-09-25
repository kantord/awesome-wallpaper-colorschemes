./full_images/%.jpeg: ./jsons/%.json
	curl `cat "$<" | emuto '[.urls.full]' -o=raw` > "$@"

