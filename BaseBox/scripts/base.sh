netstat -rn > /etc/saved_hosts
echo "Test" >> /etc/saved_hosts

echo "`netstat -rn | grep \"^0.0.0.0 \" | cut -d \" \" -f10` hostserver" >> /etc/hosts

#echo 'Acquire::http::Proxy "http://hostserver:3142";' >> /etc/apt/apt.conf.d/01proxy

apt-get update
apt-get -y dist-upgrade

apt-get -y install linux-headers-$(uname -r)

apt-get -y install dkms
apt-get -y install nfs-common

sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=sudo' /etc/sudoers
sed -i -e 's/%sudo  ALL=(ALL:ALL) ALL/%sudo  ALL=NOPASSWD:ALL/g' /etc/sudoers

echo "UseDNS no" >> /etc/ssh/sshd_config
echo "GSSAPIAuthentication no" >> /etc/ssh/sshd_config

# vagrant prefers no tty
echo "Defaults !requiretty" >> /etc/sudoers

