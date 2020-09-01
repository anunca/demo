#AP

sudo ifconfig wlo1 192.168.0.17 netmask 255.255.255.0 up

ip a

sudo ip route add 192.168.0.0/24 dev wlo1

sudo route add default gw 192.168.0.254 wlo1

iw wlo1 info

sudo reboot

Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         192.168.0.254   0.0.0.0         UG    100    0        0 eno2
169.254.0.0     0.0.0.0         255.255.0.0     U     1000   0        0 eno2
172.17.0.0      0.0.0.0         255.255.0.0     U     0      0        0 docker0
172.18.0.0      0.0.0.0         255.255.0.0     U     0      0        0 br-8dc7465517d7
192.168.0.0     0.0.0.0         255.255.255.0   U     100    0        0 eno2

Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         192.168.0.254   0.0.0.0         UG    600    0        0 wlo1
169.254.0.0     0.0.0.0         255.255.0.0     U     1000   0        0 wlo1
192.168.0.0     0.0.0.0         255.255.255.0   U     600    0        0 wlo1

#

sudo apt install -y hostapd

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

#

sudo bash -c "cat <<EOF > /etc/netplan/01-network-manager-all.yaml
# Let NetworkManager manage all devices on this system
network:
  version: 2
  renderer: NetworkManager
  ethernets:
    wlo1:
     dhcp4: no
     addresses: [192.168.0.17/24]
     gateway4: 192.168.0.254
     nameservers:
       addresses: [192.168.0.254,8.8.8.8]
EOF"

sudo bash -c "cat <<EOF > /etc/netplan/01-network-manager-all.yaml
# Let NetworkManager manage all devices on this system
network:
  version: 2
  renderer: NetworkManager
EOF"

sudo netplan apply

ip a

#

sudo apt install -y dnsmasq

sudo bash -c "cat <<EOF > /etc/NetworkManager/NetworkManager.conf
[main]
plugins=ifupdown,keyfile,ofono
dns=dnsmasq
 
[ifupdown]
managed=false
EOF"


sudo bash -c "cat <<EOF > /etc/NetworkManager/NetworkManager.conf
[main]
plugins=ifupdown,keyfile

[ifupdown]
managed=false

[device]
wifi.scan-rand-mac-address=no
EOF"
