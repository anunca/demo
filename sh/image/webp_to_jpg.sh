#!/bin/bash

for F in ls *.webp; do ffmpeg -i "$F" "${F%.webp}.jpg" && rm "$F"; done