# Make the audio file the specified second length.
# REQ: ffmpeg
function audio-sec-length
    if ! string length -q $argv
        echo "usage: audio-sec-length [NUM seconds] [BASE_FILE] [NEW_FILE]"
        return 1
    end

    ffmpeg -i $argv[2] -vn -ac 2 -ar 44100 -ab 256k -acodec libmp3lame -f mp3 tmp.mp3
    ffmpeg -ss 00:00:00 -i tmp.mp3 -t $argv[1] -c copy $argv[3]
    rm tmp.mp3
end
