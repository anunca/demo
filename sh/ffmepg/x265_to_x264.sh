#!/bin/bash

for f in *.x265.mp4;
do
  # audioformat=$(ffprobe -loglevel error -select_streams a:0 -show_entries stream=codec_name -of default=nw=1:nk=1 "$f")
  # if [ "$audioformat" = "aac" ];
  # then
  #   ffmpeg -i "$f" -c:v libx264 -crf 23 -preset medium -c:a copy -movflags +faststart "${f%.*}.mp4"
  # else
  #   ffmpeg -i "$f" -c:v libx264 -crf 23 -preset medium -c:a aac -movflags +faststart "${f%.*}.mp4"
  
  ffmpeg -i "$f" -c:v libx264 -crf 23 -preset medium -c:a copy "${f%.x265.*}.x264.mkv"
done
