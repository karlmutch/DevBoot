vagrant plugin install landrush
vagrant plugin install vagrant-hostmanager
vagrant plugin install vagrant-hostsupdater
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-cachier

VBoxManage hostonlyif create
VBoxManage hostonlyif ipconfig "VirtualBox Host-Only Ethernet Adapter #2" --ip 192.168.58.250
VBoxManage dhcpserver remove --ifname "VirtualBox Host-Only Ethernet Adapter #2"
VBoxManage dhcpserver add --ifname "VirtualBox Host-Only Ethernet Adapter #2" --ip 192.168.58.99 --netmask 255.255.255.0 --lowerip 192.168.58.101 --upperip 192.168.58.249 --enable

echo "packer build -var-file=windows.vars GoDev.json"
echo "vagrant up"
echo "vagrant hostmanager"
echo "vagrant ssh"
