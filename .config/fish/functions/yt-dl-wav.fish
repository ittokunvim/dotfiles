# download wav from youtube.com
function yt-dl-wav
  if string length -q $argv
    youtube-dlc --ignore-errors -x --audio-format wav -o '%(title)s.%(ext)s' $argv
  else
    echo "usage: yt-dl-wav [URL]"
  end
end
