#!/bin/bash

arr=( "$@" )


if [ ! -z arr ]
then
	path=`pwd`

	cd ${arr[0]}



	read -p "Enter number of videous: " number_of_videous
	
	

	for ((i=0;i<number_of_videous;i++))
	do
		read -p "Enter the resolution: " resolution
		
		if [ $resolution -eq 1080 ]
		then
			mkdir "${arr[1]}_1080_directory"
			ffmpeg -i ${arr[1]} -vf scale=1920:1080 -preset slow -crf 18 "${arr[1]}_1080_directory/output.mp4"
			arr1=("${arr[1]}_1080_directory/output.mp4" "$resolution" )
			bash "$path"/check_resolution_video.sh "${arr1[@]}"
			bash "$path"/bitrate.sh "${arr[1]}_1080_directory" "output.mp4" "${arr[0]}" "$path"
			
		elif [ $resolution -eq 720 ]
			then
				mkdir "${arr[1]}_720_directory"
				ffmpeg -i ${arr[1]} -vf scale=1280:720 -preset slow -crf 18 "${arr[1]}_720_directory/output.mp4"
				arr1=("${arr[1]}_720_directory/output.mp4" "$resolution" )
				bash "$path"/check_resolution_video.sh "${arr1[@]}"
				bash "$path"/bitrate.sh "${arr[1]}_720_directory" "output.mp4" "${arr[0]}" "$path"
		fi		
	done


	sudo cp -r segments/ /var/www/html/
fi