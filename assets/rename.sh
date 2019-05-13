#!/bin/bash
NUMFILES=$(ls | wc -l)
COUNTER=1
for file in ./photos/*; do
	if [ -d $file ]; then
		for i in $file/*; do
			mv $i "$file/$(basename $file)$COUNTER.jpg"
			let "COUNTER++"
		done
		let "COUNTER=1"
	fi
done
exit 0
