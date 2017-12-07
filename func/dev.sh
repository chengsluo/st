#!/bin/sh
#developing tools for st

set -e

case $1 in

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
return
;;
esac

cd st
ls
return
;;

esac


if [[ `git config --get remote.origin.url` != "git@github.com:wolfogre/st.git" && `git config --get remote.origin.url` != "https://github.com/wolfogre/st.git" ]]; then
	echo please go to st repo dir
	return
fi

case $1 in

commit)
git add --all
git status
read -p "any message?" MSG
git commit -m "(`cat version`) $MSG"
git push origin master
;;

version)
echo current version is `cat version`
read -p "new version (empty to skip):" NEWV
if [[ -z "$NEWV" ]]; then
	echo skipped
else
	echo $NEWV".0" > version
	echo current version is `cat version`
fi
;;

*)
echo "
dev clone
dev commit
"
;;

esac
