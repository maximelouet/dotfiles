function dl-youtube --description "wrap yt-dlp with sensible defaults" --wraps yt-dlp
  yt-dlp \
    -o "%(uploader)s - %(title)s - %(upload_date)s" \
    -f "(401/571/315/313/308/271/616)+251/(299/137/298/136)+140" \
    --merge-output-format mkv \
    --embed-thumbnail --embed-subs --embed-metadata \
    --sponsorblock-mark "sponsor,intro,outro,selfpromo" \
    -N 2 \
    --limit-rate 4M \
    --sleep-requests 5 \
    --min-sleep-interval 10 \
    --max-sleep-interval 40 \
    --sleep-subtitles 5 \
    $argv
end
