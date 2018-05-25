#!/bin/sh
echo [$0] $1 ... > /dev/console
LPIDF="/var/run/ppp-loop-<?=$linkname?>.pid"
PIDF="/var/run/ppp-<?=$linkname?>.pid"
case "$1" in
start)
	while [ -f /var/run/ppp-<?=$linkname?>.status ]; do
		echo "File: \"/var/run/ppp-<?=$linkname?>.status\" is existed that's meaning pppd still alive, so we are waiting ..." > /dev/console
		sleep 1
	done
	/var/run/ppp-loop-<?=$linkname?>.sh > /dev/console &
	echo $! > $LPIDF
	;;
stop)
	if [ -f "$LPIDF" ]; then
		pid=`cat $LPIDF`
		if [ "$pid" != "0" ]; then
			kill $pid > /dev/console 2>&1
		fi
		rm -f $LPIDF
	fi
	if [ -f "$PIDF" ]; then
		pid=`pfile -f $PIDF`
		if [ "$pid" != "0" ]; then
			echo "pid =`cat $LPIDF`"
			kill $pid > /dev/console 2>&1
		fi
		rm -f $PIDF
	fi
	sleep 1
	while [ -f /var/run/ppp-<?=$linkname?>.status ]; do
		echo "File: \"/var/run/ppp-<?=$linkname?>.status\" is existed, killing pppd ..." > /dev/console
		killall pppd > /dev/null 2>&1
		sleep 1
	done
	;;
*)
	echo "usage: pppd-<?=$linkname?>.sh [start|stop]" > /dev/console
	;;
esac
exit 0
