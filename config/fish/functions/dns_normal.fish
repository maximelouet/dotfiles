function dns_normal --description "restore normal DNS in /etc/resolv.conf"
    sudo sed -i '/TMP dhcp_dns/d' /etc/resolv.conf
    if [ -z "$1" ]
        cat /etc/resolv.conf
        fi
    end
end
