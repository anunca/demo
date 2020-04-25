#!/bin/bash

for F in *.cbz
do
    unzip -j "$F"
done

for F in ls *.webp; do ffmpeg -i "$F" "${F%.webp}.jpg" && rm "$F"; done