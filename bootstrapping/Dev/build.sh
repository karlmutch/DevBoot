mkdir input || true
rm input/* || true
(cd input ; tar xvf ../../BaseBox/build/BaseBox.box ; cd ..)
unamestr=`uname`
case unamestr in
    Darwin) ;;
    *) [ -z "$USER" ] && export USER=$USERNAME ;;
esac
packer build Dev.json
