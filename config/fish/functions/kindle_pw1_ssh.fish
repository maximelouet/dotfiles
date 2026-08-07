function kindle_pw1_ssh
  set mac_address "F0:4F:7C:1E:3B:2D"
  # Try from ARP table
  set ip (ip --color=never --brief neighbor | grep -iF "$mac_address" | awk '{print $1}')
  # If we didn't find it, trigger an ARP scan
  if [ -z "$ip" ]
    set ip (arp-scan -q -l 2>/dev/null | grep -iF "$mac_address" | awk '{print $1}')
  end
  if [ -z "$ip" ]
    echo "Kindle not found on local network with MAC $mac_address." >&2
    return 1
  end
  ssh "root@$ip"
end
