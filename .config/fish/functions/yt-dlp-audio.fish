# Convert videos downloaded from Youtube to audio
# REQ: yt-dlp
function yt-dlp-audio
    if ! string length -q $argv
        echo "usage: yt-dlp-audio [FORMAT] [URL]"
        return 1
    end

    yt-dlp --ignore-errors -x --audio-format $argv[1] -o '%(title)s.%(ext)s' $argv[2]
end
