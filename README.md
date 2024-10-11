# portable mp3 player, feature phone and handheld game console - video converter tools

## What it does

scripts to convert videos in several portable players formats through ffmpeg. It creates a file with the same name than source but ended in "-p".

## Dependencies

ffmpeg

these scripts are designed to run in linux.

## Players supported

AVI Format - Portable MP3 Player Shenju YP3 1.8 inch 128x160 branded as Rockstar Audio Player, AideeMaster  
AVI Format - Portable MP3 Player Shenju YP3 2.4 inch 240x320 branded as Rockstar Audio Player, Mini Music Player  
AMV Format - Portable MP3 Player Actions 1.8 inch 128x160 branded as Zyzy Music Player, Hello Kitty MP3 Player  
AMV Format - Portable MP3 Player Actions 2.4 inch 240x320 branded as Rijaho Music Player, RUIZU Music Player  
MP4 Format - Portable MP3 Player Spreadtrum UNISOC 1.8 inch 128x160 branded as Rockstar Audio Player (2022 discontinued)  
3GP Format - Feature Phone 1.8 inch 128x160 branded as MKTEL OYE 3, MKTEL M2023  
3GP Format - Feature Phone 2.4 and 2.8 inch 240x320 feature phone branded as S-Mobile, Servo, MKTEL 14 PRO MAX, Hoswn i79  
MP4 Format - Handheld Game Console 4.3 inch 480x272 handheld game console branded as MP5 X7  

## How to know the player format

Brandless portable players often dont specify clearly the video format that is supported, to know what type of format is there is available sample videos in the folder test_videos_to_know_format_supported.  
  
The sample is a fragment of 30 seconds of the Creative Commons video Big Buck Bunny https://en.wikipedia.org/wiki/Big_Buck_Bunny  

## Usage

    $ video2shenju24.sh <video file>
    $ video2shenju18.sh <video file>
    $ video2actions24.sh <video file>
    $ video2actions18.sh <video file>
    $ video2spreadtrum18.sh <video file>
    $ video2phone18.sh <video file>
    $ video2phone24.sh <video file>
    $ video2gameconsole43.sh <video file>

## Example

    $ video2shenju24.sh video.mp4

## Syntax to use another versions of FFmpeg

You can use FFmpeg in Windows/Mac and Android, but previous scripts are only for linux versions, if you want to use another versions, you can just use the next syntax of FFmpeg:  

Portable MP3 Player AVI Format - Shenju 1.8 inch:  
ffmpeg -i source.mp4 -vf "scale=-2:128, crop=160:128, transpose=2, vflip" -r 16 -acodec pcm_s16le -ac 2 -ar 22050 -pix_fmt yuvj420p -c:v mjpeg -q:v 2 dest.avi  
  
Portable MP3 Player AVI Format - Shenju 2.4 inch:  
ffmpeg -i source.mp4 -vf "scale=-2:240, crop=320:240, transpose=2, vflip" -r 6 -acodec pcm_s16le -ac 2 -ar 22050 -pix_fmt yuvj420p -c:v mjpeg -q:v 10 dest.avi  
  
Portable MP3 Player AMV Format - Actions 1.8 inch:  
ffmpeg -i source.mp4 -vf "scale=-2:128, crop=160:128" -r 14 -pix_fmt yuvj420p -c:v amv -c:a adpcm_ima_amv -ac 1 -ar 22050 -block_size 1575 dest.amv  
  
Portable MP3 Player AMV Format - Actions 2.4 inch:  
ffmpeg -i source.mp4 -vf "scale=-2:240, crop=320:240" -r 14 -pix_fmt yuvj420p -c:v amv -c:a adpcm_ima_amv -ac 1 -ar 22050 -block_size 1575 dest.amv  
  
Portable MP3 Player MP4 Format - Spreadtrum UNISOC 1.8 inch:  
ffmpeg -i source.mp4 -vf "scale=-2:128, crop=160:128" -r 14 -pix_fmt yuv420p -c:v libx264 -profile:v baseline -level 1 -c:a aac -b:a 160k dest.mp4

Feature Phone 3GP Format - 1.8 inch:  
ffmpeg -i source.mp4 -vf "scale=-2:144,crop=176:144" -q:v 1 -r 14 -ar 44100 -ac 2 -c:a aac -b:a 320k dest.3gp  

Feature Phone 3GP Format - 2.4 inch and 2.8 inch:  
ffmpeg -i source.mp4 -vf "scale=-2:288,crop=352:288" -q:v 1 -r 14 -ar 44100 -ac 2 -c:a aac -b:a 320k dest.3gp 

Handheld Game Console MP4 Format - 4.3 inch:  
ffmpeg -i source.mp4 -vf "scale=-2:272, crop=480:272" -r 14 -pix_fmt yuv420p -c:v libx264 -profile:v baseline -level 1 -c:a aac -b:a 160k dest.mp4  

## How to add subtitles

Add ",subtitles=source.srt:force_style='Fontname=Arial,Fontsize=28,PrimaryColour=&H00FFFFFF,SecondaryColour=&H000000FF,BorderStyle=1,Shadow=2'" to "vf" argument if the subtitle filename is source.srt.  
e.g: ffmpeg -i source.mp4 -vf "scale=-2:128, crop=160:128,subtitles=source.srt:force_style='Fontname=Arial,Fontsize=28,PrimaryColour=&H00FFFFFF,SecondaryColour=&H000000FF,BorderStyle=1,Shadow=2', transpose=2, vflip" -r 16 -acodec pcm_s16le -ac 2 -ar 22050 -pix_fmt yuvj420p -c:v mjpeg -q:v 2 dest.avi  

## How to cut video in fragments every 5 minutes

Add "-map 0 -segment_time 00:05:00 -f segment -reset_timestamps 1" before destination name, and "%02d" (fragment number) in the destination filename.  
e.g: ffmpeg -i source.mp4 -vf "scale=-2:128, crop=160:128, transpose=2, vflip" -r 16 -acodec pcm_s16le -ac 2 -ar 22050 -pix_fmt yuvj420p -c:v mjpeg -q:v 2 -map 0 -segment_time 00:05:00 -f segment -reset_timestamps 1 dest%02d.avi  

## Where to get those players?

All those players are/were available to buy in AliExpress and similar online shops (Shopee, eBay, and so on).  
  
4.3 inch MP5 X7 4.3 https://s.click.aliexpress.com/e/_DDK6N4H  
2.8 inch S-Mobile Feature phone https://s.click.aliexpress.com/e/_Dmwte27  
2.4 inch Hoswn i79 Feature phone https://s.click.aliexpress.com/e/_DlKuR7F  
2.4 inch Shenju Portable MP3 Player touchscreen https://s.click.aliexpress.com/e/_DEnTDFZ  
1.8 inch Shenju Portable MP3 Player round button https://s.click.aliexpress.com/e/_DDVf1Ph  
1.8 inch Shenju Portable MP3 Player round button https://s.click.aliexpress.com/e/_DmEggA7  
1.8 inch Shenju Portable MP3 Player side button https://s.click.aliexpress.com/e/_DlJWPNf
1.8 inch Actions Hello Kitty MP3 Player https://s.click.aliexpress.com/e/_DDUd7U5  
1.8 inch MKTEL Oye 3 Feature phone https://s.click.aliexpress.com/e/_Deu0nvz  
1.8 inch MKTEL M2023 Feature phone https://s.click.aliexpress.com/e/_Dk0CZNB  

## Related projects

https://github.com/fdd4s/shazam-autotag

## Credits

Created by fdd4s  
Send feedback and questions to fc1471789@gmail.com  
All .sh files are public domain https://unlicense.org/  
