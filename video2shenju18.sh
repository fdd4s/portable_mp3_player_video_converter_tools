#!/bin/bash
name="${1%.*}"

ffmpeg -i "$1" -vf "scale=-2:128, crop=160:128, transpose=2, vflip" -r 16 -acodec pcm_s16le -ac 2 -ar 22050 -pix_fmt yuvj420p -c:v mjpeg -q:v 2 "$name"-p.avi

echo "$name"-p.avi created

