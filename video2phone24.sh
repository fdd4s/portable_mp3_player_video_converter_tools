#!/bin/bash
name="${1%.*}"

ffmpeg -i "$1" -vf "scale=-2:288,crop=352:288" -q:v 1 -r 14 -ar 44100 -ac 2 -c:a aac -b:a 320k "$name"-p.3gp

echo "$name"-p.3gp created

