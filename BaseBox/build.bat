rm build/BaseBox.box || true
mkdir build || true
rm build/* || true
packer build -var-file=windows.vars Base.json
