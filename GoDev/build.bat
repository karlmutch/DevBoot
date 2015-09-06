mkdir input || true
mkdir input/virtualbox || true
rm input/virtualbox/*.* input/virtualbox/Vagrantfile || true
cp -r $(echo $USERPROFILE)/.vagrant.d/boxes/BaseBox/0/virtualbox/ input/.
packer build GoDev.json
