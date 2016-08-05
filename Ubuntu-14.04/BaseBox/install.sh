VBoxManage hostonlyif create
VBoxManage hostonlyif ipconfig vboxnet0 --ip 192.168.58.1
VBoxManage dhcpserver remove --ifname vboxnet0
VBoxManage dhcpserver add --ifname vboxnet0 --ip 192.168.58.1 --netmask 255.255.255.0 --lowerip 192.168.58.100 --upperip 192.168.58.200
VBoxManage dhcpserver modify --ifname vboxnet0 --enable
VBoxManage natnetwork add --netname NatNetwork --enable --dhcp on  --network 10.0.2.0/24
