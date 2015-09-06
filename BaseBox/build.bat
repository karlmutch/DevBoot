rm build/BaseBox.box || true
mkdir build || true
rm build/* || true
packer build -var-file=windows.vars Base.json
vagrant box remove BaseBox || true
vagrant box add ./Build/BaseBox.box --name BaseBox
