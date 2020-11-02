#!/bin/bash

# pidlsey special

STREAM_FILE=~/.bin/stream-list

[[ ! -f "$STREAM_FILE" ]] && echo "$STREAM_FILE does not exist" && exit 1

array=( $(cat "$STREAM_FILE") )

select opt in "${array[@]}"; do
    [[ $1 =~ ^-r ]] && streamripper "$opt" &
    #mpg123 -@ "$opt"
    mpv --load-unsafe-playlists "$opt" --cache 1000 --msg-level=cplayer=no:ffmpeg/audio=no:ffmpeg/demuxer=no:ffmpeg/video=no:ad=no --no-video
    break
done
