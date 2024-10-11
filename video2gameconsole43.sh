#!/bin/bash
name="${1%.*}"

ffmpeg -i "$1" -vf "scale=-2:272, crop=480:272" -r 14 -pix_fmt yuv420p -c:v libx264 -profile:v baseline -level 1 -c:a aac -b:a 160k "$name"-p.mp4

echo "$name"-p.mp4 created

