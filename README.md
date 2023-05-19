# portable mp3 player - video converter tools

## What does

scripts to convert videos into several portable mp3 players formats through ffmpeg. It creates as result a file with the same name than source but ended in "-p".

## Dependencies

ffmpeg

this code is designed to work over linux.

## Players supported

AVI Format - Shenju 1.8 inch 128x160 players  
AVI Format - Shenju 2.4 inch 240x320 players  
AMV Format - Actions 1.8 inch 128x160 players  
AMV Format - Actions 2.4 inch 240x320 players  
MP4 Format - Spreadtrum 1.8 inch 128x160 players  

## How to know to the kind of player

Brandless portable mp3 players often dont specify clearly the video format that is supported, to know what type of format is there is available sample videos in the folder test_videos_to_know_format_supported.

It's used as sample a fragment of 30 seconds of the Creative Commons video Big Buck Bunny https://en.wikipedia.org/wiki/Big_Buck_Bunny

## Usage

    $ video2shenju24.sh <video file>
    $ video2shenju18.sh <video file>
    $ video2actions24.sh <video file>
    $ video2actions18.sh <video file>
    $ video2spreadtrum18.sh <video file>

## Examples

    $ video2shenju24.sh video.mp4
    $ video2shenju18.sh video.mp4
    $ video2actions24.sh video.mp4
    $ video2actions18.sh video.mp4
    $ video2spreadtrum18.sh video.mp4

## Syntax to use another versions of FFmpeg

You can use FFmpeg in Windows/Mac and Android, but these scripts are only for linux versions, if you want to use another versions, you can just use the next syntax of FFmpeg:  

AVI Format - Shenju 1.8 inch:  
ffmpeg -i source.mp4 -vf "scale=-2:128, crop=160:128, transpose=2, vflip" -r 16 -acodec pcm_s16le -ac 2 -ar 22050 -pix_fmt yuv420p -c:v mjpeg -q:v 2 dest.avi  
  
AVI Format - Shenju 2.4 inch:  
ffmpeg -i source.mp4 -vf "scale=-2:240, crop=320:240, transpose=2, vflip" -r 6 -acodec pcm_s16le -ac 2 -ar 22050 -pix_fmt yuv420p -c:v mjpeg -q:v 10 dest.avi  
  
AMV Format - Actions 1.8 inch:  
ffmpeg -i source.mp4 -vf "scale=-2:128, crop=160:128" -r 14 -pix_fmt yuv420p -c:v amv -c:a adpcm_ima_amv -ac 1 -ar 22050 -block_size 1575 dest.amv  
  
AMV Format - Actions 2.4 inch:  
ffmpeg -i source.mp4 -vf "scale=-2:240, crop=320:240" -r 14 -pix_fmt yuv420p -c:v amv -c:a adpcm_ima_amv -ac 1 -ar 22050 -block_size 1575 dest.amv  
  
MP4 Format - Spreadtrum 1.8 inch:  
ffmpeg -i source.mp4 -vf "scale=-2:128, crop=160:128" -r 14 -pix_fmt yuv420p -c:v libx264 -profile:v baseline -level 1 -c:a aac -b:a 160k dest.mp4  


## Credits

Created by fdd  
Send feedback and questions to fdd4776s@gmail.com  
Support future improvements of this software https://www.buymeacoffee.com/fdd4s  
All .sh files are public domain https://unlicense.org/  
