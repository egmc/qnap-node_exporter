#!/bin/bash

DAEMON_MGR="/sbin/daemon_mgr"
NAME=node_exporter
PROG=/usr/local/node_exporter/node_exporter
OPT=""

case "$1" in
    start)
        mypid=`/bin/pidof $NAME`
        if [ ! -z $mypid ]; then
                exit 1
        else
            echo -n "Starting $NAME: "
            $DAEMON_MGR $NAME start "$PROG $OPT &"
            exit 0
        fi
        ;;
    stop)
        echo -n "Stopping $NAME: "
        $DAEMON_MGR $NAME stop "$PROG"
        echo
        ;;
    *)
        echo "Usage: $1 start|stop"
        exit 1
        ;;
esac

exit 0
