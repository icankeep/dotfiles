#!/bin/bash

# Usage: ./ddns.sh -t $DNSPOD_API_TOKEN -d $YOUR_DYNAMIC_DOMAIN

while [[ $# -gt 1 ]]
do
    key="$1"
    case "$key" in
        -t|--token)
            DNSPOD_API_TOKEN="$2"
            shift
            ;;
        -d|--domain)
            DYNAMIC_DOMAIN="$2"
            shift
            ;;
        *)
            # Unknown option
            echo "Unknonw option: $key"
    esac
    shift # past argument or value
done

DOMAIN=${DYNAMIC_DOMAIN#*.}
SUB_DOMAIN=${DYNAMIC_DOMAIN%%.*}

echo "DNSPOD_API_TOKEN: $DNSPOD_API_TOKEN"
echo "DYNAMIC_DOMAIN: $DYNAMIC_DOMAIN"
echo "DOMAIN: $DOMAIN"
echo "SUB_DOMAIN: $SUB_DOMAIN"


updateDNS() {
    REGEX_IP='([0-9]+\.){3}[0-9]+'

    realIP="$(curl -s ipinfo.io/ip)"
    resolvedIP="$(dig +short $DYNAMIC_DOMAIN)"

    echo "realIP: $realIP"
    echo "resolvedIP: $resolvedIP"

    echo $realIP | egrep $REGEX_IP > /dev/null || return

    if [[ "$realIP" = "$resolvedIP" ]]
    then
        return
    else
        echo "$(date): Update DYNAMIC_DOMAIN to $realIP"
        record_id=$(curl -sX POST https://dnsapi.cn/Record.List -d "login_token=$DNSPOD_API_TOKEN&format=json&domain=$DOMAIN" | jq -r ".records[] | select(.name == \"$SUB_DOMAIN\") | .id" | head -1)
        if [ -z "$record_id" ]; then
            curl -sX POST https://dnsapi.cn/Record.Create -d "login_token=$DNSPOD_API_TOKEN&format=json&domain=$DOMAIN&sub_domain=$SUB_DOMAIN&record_type=A&record_line_id=0&value=$realIP"
        else
            curl -sX POST https://dnsapi.cn/Record.Modify -d "login_token=$DNSPOD_API_TOKEN&format=json&record_id=$record_id&domain=$DOMAIN&sub_domain=$SUB_DOMAIN&record_type=A&record_line_id=0&value=$realIP"
        fi
    fi
}

while true
do
    updateDNS
    sleep 600
done
