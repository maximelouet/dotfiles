function dns_from_the_fucking_network_im_connected_to
    dns_normal --quiet
    echo "Sending DHCP Discover request with nmap..."
    set -l found (sudo nmap --script broadcast-dhcp-discover --script-args 'timeout=5' 2>&1)
    set -l dns_server (echo "$found" | grep -o "Domain Name Server: .* " | awk '{print $4}')
    if [ (string length "$dns_server") -lt 9 ]
        echo "No DNS servers found. nmap reply:" >&2
        echo $found >&2
        return 1
    else
        sudo sed -i "1s/^/nameserver $dns_server # TMP dhcp_dns\n/" /etc/resolv.conf
        echo "Added $dns_server as the first nameserver in /etc/resolv.conf"
        echo "Run dns_normal at any time to remove this entry."
    end
end
