# Saumon ZSH aliases
# Shortcuts

coverfetch () {
  (
    cd ~/git/coverfetch
    nvm use > /dev/null 2>&1
    eval $(op signin)
    PTPIMG_APIKEY=$(op item get "PTPimg API key" --fields=password)
    if [ ${#PTPIMG_APIKEY} -ne 36 ]; then
      >&2 echo "Warning: could not get PTPIMG_APIKEY from 1Password, not uploading"
      npm start --silent -- $@
    fi
    export PTPIMG_APIKEY
    npm start --silent -- -u $@
  )
}

kindle_local_ssh () {
  sudo ip link set up dev enp2s0f0u4
  sudo ip address add 192.168.15.201 peer 192.168.15.244 dev enp2s0f0u4
  echo "ssh root@192.168.15.244"
  ssh root@192.168.15.244
}

kindle_pw1_ssh () {
  mac_address="F0:4F:7C:1E:3B:2D"
  # Try from ARP table
  ip=$(ip --color=never --brief neighbor | grep -iF "$mac_address" | awk '{print $1}')
  # If we didn't find it, trigger an ARP scan
  if [ -z "$ip" ]; then
    ip=$(arp-scan -q -l 2>/dev/null | grep -iF "$mac_address" | awk '{print $1}')
  fi
  if [ -n "$ip" ]; then
    ssh "root@$ip"
  else
    >&2 echo "Kindle not found on local network with MAC $mac_address."
    return 1
  fi
}

kindle_pw3_ssh () {
  mac_address="F0:27:2D:1A:E4:C9"
  # Try from ARP table
  ip=$(ip --color=never --brief neighbor | grep -iF "$mac_address" | awk '{print $1}')
  # If we didn't find it, trigger an ARP scan
  if [ -z "$ip" ]; then
    ip=$(arp-scan -q -l 2>/dev/null | grep -iF "$mac_address" | awk '{print $1}')
  fi
  if [ -n "$ip" ]; then
    ssh "root@$ip"
  else
    >&2 echo "Kindle not found on local network with MAC $mac_address."
    return 1
  fi
}

dl-youtube () {
  yt-dlp \
    -o "%(uploader)s - %(title)s - %(upload_date)s" \
    -f "(401/571/315/313/308/271/616)+251/(299/137/298/136)+140" \
    --merge-output-format mkv \
    --embed-thumbnail --embed-subs --embed-metadata \
    --sponsorblock-mark "sponsor,intro,outro,selfpromo" \
    -N 2 \
    $@
}

dl-youtube-slow () {
  yt-dlp \
    -o "%(uploader)s - %(title)s - %(upload_date)s" \
    -f "(401/571/315/313/308/271/616)+251/(299/137/298/136)+140" \
    --merge-output-format mkv \
    --embed-thumbnail --embed-subs --embed-metadata \
    --sponsorblock-mark "sponsor,intro,outro,selfpromo" \
    -N 2 \
    --limit-rate 8M \
    --sleep-requests 5 \
    --min-sleep-interval 10 \
    --max-sleep-interval 40 \
    --sleep-subtitles 5 \
    $@
  }
