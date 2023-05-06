#!/bin/bash

arr=( "$@" )

cd ${arr[0]}

read -p "Enter the number of diffent bitrtes: " number_of_bitrates

for((j=0;j<$number_of_bitrates;j++))
do
	read -p "Enter bitrate: " bitrate
	arr1[$j]=$bitrate
done

j=0

counter=0
for i in "${arr1[@]}"
do
	ffmpeg -i ${arr[1]} -c:v:0 libx264 -x264-params "nal-hrd=cbr:force-cfr=1 " -b:v "$i"M -minrate:v:0 5M -bufsize:v:0 10M -preset slow -g 48 -sc_threshold 0 -keyint_min 48  "output_$i.mp4"
	arr2[$j]="Video ${arr[0]}/output_$i.mp4 is done"
	j=$((j+1))
done

for ((i=0;i<$j;i++))
do
	echo "${arr2[$i]}"	

done

# mkdir "${arr[1]}/segments"

for i in "${arr1[@]}"
do
	arr3=("${arr[0]}/output_$i.mp4" "${arr[2]}" "output_$i" "${arr[0]}")
	bash "${arr[3]}/hsl.sh" "${arr3[@]}"
done





