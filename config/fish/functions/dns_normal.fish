function dns_normal --description "restore normal DNS in /etc/resolv.conf"
    sudo sed -i '/TMP dhcp_dns/d' /etc/resolv.conf
    if [ -z $argv[1] ]
        cat /etc/resolv.conf
    end
end
