function dns_from_the_fucking_network_im_connected_to
    dns_normal
    echo "Sending DHCP Discover request with nmap..."
    set found $(sudo nmap --script broadcast-dhcp-discover 2>&1)
    set dns_server $(echo "$found" | grep "Domain Name Server" | awk '{print $5}')
    if [ -z "$dns_server" ]
        echo "No DNS servers found. nmap reply:" >&2
        echo $found >&2
        return 1
    else
        sudo sed -i "1s/^/nameserver $dns_server # TMP dhcp_dns\n/" /etc/resolv.conf
        echo "Added $dns_server as the first nameserver in /etc/resolv.conf"
        echo "Run dns_normal at any time to remove this entry."
    end
end
