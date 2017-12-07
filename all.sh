
st() {
case $1 in

version)
echo st version 0.0.0.26, build time Thu Dec 7 10:25:35 CST 2017
;;

dev)
set -e
case $2 in

clone)
read -p "use ssh or https?" PROT

case $PROT in

https)
git clone https://github.com/wolfogre/st.git
;;
ssh)
git clone git@github.com:wolfogre/st.git
;;
*)
echo unknown protocol
exit 1
;;
esac

cd st
ls
;;

commit)
git add --all
git status
read -p "any message?" MSG
git commit -m "(`cat version`) $MSG"
git push origin master
;;


*)
echo "
dev clone
"
;;

esac
set +e
;;
hello)
set -e
#show hello
echo hello st!
set +e
;;

esac
}
