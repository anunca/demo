#hostapd

sudo apt install hostapd

sudo touch /etc/hostapd/hostapd.conf

sudo bash -c "cat <<EOF > /etc/hostapd/hostapd.conf
interface=wlo1
driver=nl80211
ssid=Next
channel=1
hw_mode=g
auth_algs=1
wpa=2
wpa_key_mgmt=WPA-PSK
wpa_pairwise=CCMP
rsn_pairwise=CCMP
wpa_passphrase=WhatSNext
EOF"

cat /etc/hostapd/hostapd.conf

sudo hostapd /etc/hostapd/hostapd.conf &

sudo killall hostapd
