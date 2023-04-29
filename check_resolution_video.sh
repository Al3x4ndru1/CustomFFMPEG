#!/bin/bash


j=0

for i in "$@"; do

	arr[$j]="$i"
	j=$((j+1))
done


resolution=`ffprobe -v error -select_streams v -show_entries stream=width,height -of csv=p=0:s=x "${arr[0]}"`

if [ ${arr[1]} -eq 1080 ] ; then	

	if [ $resolution == '1920x1080' ] ; then
		echo "The video: ${arr[1]} is true"

	fi

elif [ ${arr[1]} -eq 720 ] ; then		
	if [ $resolution == '1280x720' ]
	then
		echo "The video: ${arr[1]} is true"
	fi
fi