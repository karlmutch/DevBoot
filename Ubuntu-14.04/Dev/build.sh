mkdir input || true
rm input/* || true
(cd input ; tar xvf ../../BaseBox/build/BaseBox.box ; cd ..)
[ -z "$USER" ] && export USER=$USERNAME
packer build Dev.json
