# 2026-01-01 01:03:36 by RouterOS 7.20.6
# system id = uxMFwwdlqvG
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
/port
set 0 name=serial0
set 1 name=serial1
/ip address
add address=192.168.20.100/24 interface=ether2 network=192.168.20.0
/ip dhcp-client
add interface=ether1
/ip firewall filter
add action=drop chain=forward dst-address=1.1.1.1 dst-port=443 protocol=tcp
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
/radius
add address=35.227.71.209 service=hotspot
