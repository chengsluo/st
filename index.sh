
rm /tmp/st_cache_$USER -rf
mkdir /tmp/st_cache_$USER
st() {
case $1 in

version)
echo st version 0.3.13, build time Wed Dec 13 09:53:10 CST 2017
;;

help)
echo -e "

  version         show st version
  adjust-time     adjust date time
  clean           clean local functions cache
  count-conn      count connections of specified port
  hello           show hello
  install-docker  install docker-ce and set mirror acceleration address
  install-go      install various version of golang
  install-svn     install svn 1.7, 1.8 or 1.9
  install-zmq     install zeromq 4.1.2
  show            show function detail

"
;;

*)
AIM=/tmp/st_cache_$USER/$1.sh
if [ ! -f $AIM ]; then
	if [[ `curl -s -o $AIM -w "%{http_code}" st.wolfogre.com/func/$1.sh` != "200" ]]; then
        	rm -rf $AIM
		echo "cant not find $1 to run"
        	return
	fi
fi
sh $AIM `echo $* | cut -s -d " " -f1 --complement`
;;
esac
}

