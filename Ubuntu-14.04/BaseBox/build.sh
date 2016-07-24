rm -rf output-virtualbox-iso || true
mkdir build || true
rm build/* || true
packer build -var-file=osx.vars Base.json
