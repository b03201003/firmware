#!/bin/sh
echo [$0] ... > /dev/console
TROOT="/etc/templates"

lanif=`xmldbc -i -g /runtime/layout/lanif`

start="lpd -I $lanif -Z 1 -U 1"

stop="killall lpd; killall rawlpd"


case "$1" in
start|restart)
	eval $stop
	eval $start
	;;
stop)
	eval $stop
	;;
delay_restart)
	sleep 2
	eval $start
	;;
*)
	echo "usage: lpd.sh {start|stop|restart|delay_restart}"
	;;
esac
