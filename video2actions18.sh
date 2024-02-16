#!/bin/bash
name="${1%.*}"

ffmpeg -i "$1" -vf "scale=-2:128, crop=160:128" -r 14 -pix_fmt yuvj420p -c:v amv -c:a adpcm_ima_amv -ac 1 -ar 22050 -block_size 1575 "$name"-p.amv

echo "$name"-p.amv created

