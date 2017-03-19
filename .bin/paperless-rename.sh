#!/bin/bash

find . -print0 | while read -d $'\0' FILE
do 	
	FILE=`echo "$FILE" | cut -d '/' -f 2`
	echo "FILE: $FILE"
	WHO=`echo "$FILE" | cut -d '-' -f 1`
	DATE=`echo "$FILE" | sed -e "s/$WHO- //" | sed -e "s/.pdf//"`

	DATE=`echo "$DATE" | sed -E "s/(.*)-(.*)-(.*)/\3-\2-\1/"`
	mv "$FILE" "$DATE $WHO.pdf"
done