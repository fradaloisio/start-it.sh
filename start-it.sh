#!/bin/bash
NAME=""
INTERPRETER=
PROGRAM=
OPTIONS=
OUTFILE=

PIDFILE="/tmp/$NAME.pid"

BASENAME=`basename $0`
PRG_HOME="$(cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
cd "$PRG_HOME"

pid=`cat $PIDFILE`
PIDEXIST=$([ -n $pid -a -d "/proc/$pid" ] && echo $pid || echo "")

if [[ "$PIDEXIST" != "" ]]; then
	echo "Running with pid $PIDEXIST"
	exit
fi

nohup $INTERPRETER $PROGRAM $OPTIONS &> $OUTFILE &
echo $! > $PIDFILE


