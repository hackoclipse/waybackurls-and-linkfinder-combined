#!/bin/bash
# credit bl4ckh4ck5
# https://twitter.com/bl4ckh4ck5
echo $1 | waybackurls | grep "\.$2" | sed 's/\?.*//' | sort -u > output-wayback.txt;
echo "amount of urls: $(cat output-wayback.txt | wc -l)"
for a in $(cat output-wayback.txt)
do
	echo "getting latest url waybackmachine: $a"
	curl https://archive.org/wayback/available?url=$a | jq .archived_snapshots.closest.url | sed 's/"//' | sed 's/"//' >> output-wayback-urls-download.txt
done
cat output-wayback-urls-download.txt | sed 's/null//' > output-wayback-urls-download-fixxed-null.txt;

wget -nv -i output-wayback-urls-download-fixxed-null.txt; 

python3 ../linkfinder.py -i "*.$2" --output cli | sort -u > output-all-urls-wayback-js.txt # change to location with linkfinder.py file.

grep "web.archive.org" output-all-urls-wayback-js.txt | awk -F "web.archive.org/" '{print $2}' | sed -r 's/^.{19}//' > output-all-urls-wayback-js-stript.txt
grep -v "web.archive.org" output-all-urls-wayback-js.txt > output-all-urls-wayback-js-stript2.txt
cat output-all-urls-wayback-js-stript*.txt | sort -u > output.txt
rm *.$2*;
cat output.txt;
