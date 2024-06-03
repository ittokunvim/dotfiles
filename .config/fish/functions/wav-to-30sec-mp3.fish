# download wav from youtube.com
function wav-to-30sec-mp3
    if ! string length -q $argv
        echo "usage: wav-to-30sec-mp3 [WAV_FILE] [MP3_FILE]"
        return 1
    end

    ffmpeg -i $argv[1] -vn -ac 2 -ar 44100 -ab 256k -acodec libmp3lame -f mp3 tmp.mp3
    ffmpeg -ss 00:00:00 -i tmp.mp3 -t 30 -c copy $argv[2]
    rm tmp.mp3
end
