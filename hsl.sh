#!/bin/bash

arr=( "$@" )


# echo "${arr[1]}"
# echo "${arr[3]}"
# echo "${arr[2]}"

# mkdir "${arr[1]}/segments"

# echo `pwd`
# cd "${arr[1]}/segments"

mkdir -p "${arr[1]}/segments/${arr[3]}/segment_${arr[2]}"
# cd "${arr[3]}/segment_${arr[2]}"

# echo `pwd`

# read -p "aa: " cuvant


ffmpeg -y -i "${arr[1]}/${arr[0]}" \
        -c copy -hls_segment_type hls\
        -hls_time 2 -hls_playlist_type vod \
        -hls_flags independent_segments -hls_segment_type mpegts \
        -hls_segment_filename "${arr[1]}/segments/${arr[3]}/segment_${arr[2]}"/data%02d.ts "${arr[1]}/segments/${arr[3]}/segment_${arr[2]}/stream_${arr[3]}_${arr[2]}".m3u8


