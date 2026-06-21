# access point
TODO?
```sh
sudo ifconfig wlo1 192.168.0.17 netmask 255.255.255.0 up
```
```sh
ip a
```
```sh
sudo ip route add 192.168.0.0/24 dev wlo1
```
```sh
sudo route add default gw 192.168.0.254 wlo1
```
```sh
iw wlo1 info
```
```sh
sudo reboot
```
```sh
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         192.168.0.254   0.0.0.0         UG    100    0        0 eno2
169.254.0.0     0.0.0.0         255.255.0.0     U     1000   0        0 eno2
172.17.0.0      0.0.0.0         255.255.0.0     U     0      0        0 docker0
172.18.0.0      0.0.0.0         255.255.0.0     U     0      0        0 br-8dc7465517d7
192.168.0.0     0.0.0.0         255.255.255.0   U     100    0        0 eno2
```
```sh
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         192.168.0.254   0.0.0.0         UG    600    0        0 wlo1
169.254.0.0     0.0.0.0         255.255.0.0     U     1000   0        0 wlo1
192.168.0.0     0.0.0.0         255.255.255.0   U     600    0        0 wlo1
```
```sh
sudo apt install -y hostapd
```
```sh
cat <<EOF | sudo tee /etc/hostapd/hostapd.conf > /dev/null
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
EOF
```
```sh
cat /etc/hostapd/hostapd.conf
```
```sh
sudo hostapd /etc/hostapd/hostapd.conf &
```
```sh
sudo killall hostapd
```
```sh
cat <<EOF | sudo tee /etc/netplan/01-network-manager-all.yaml > /dev/null
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
EOF
```
```sh
cat <<EOF | sudo tee /etc/netplan/01-network-manager-all.yaml > /dev/null
# Let NetworkManager manage all devices on this system
network:
  version: 2
  renderer: NetworkManager
EOF
```
```sh
sudo netplan apply
```
```sh
ip a
```
```sh
sudo apt install -y dnsmasq
```
```sh
cat <<EOF | sudo tee /etc/NetworkManager/NetworkManager.conf > /dev/null
[main]
plugins=ifupdown,keyfile,ofono
dns=dnsmasq
 
[ifupdown]
managed=false
EOF
```
```sh
cat <<EOF | sudo tee /etc/NetworkManager/NetworkManager.conf > /dev/null
[main]
plugins=ifupdown,keyfile

[ifupdown]
managed=false

[device]
wifi.scan-rand-mac-address=no
EOF
```