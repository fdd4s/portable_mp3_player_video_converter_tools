#!/bin/bash
name="${1%.*}"

ffmpeg -i "$1" -vf "scale=-2:240, crop=320:240, transpose=2, vflip" -r 6 -acodec pcm_s16le -ac 2 -ar 22050 -pix_fmt yuv420p -c:v mjpeg -q:v 10 "$name"-p.avi

echo "$name"-p.avi created

