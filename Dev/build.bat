mkdir input || true
rm input/* || true
(cd input ; tar xvf ../../BaseBox/build/BaseBox.box ; cd ..)
packer build Dev.json
