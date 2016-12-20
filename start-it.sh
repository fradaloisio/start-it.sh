#!/bin/bash
BASENAME=`basename $0`
PRG_HOME=`echo $0| sed "s/$BASENAME//g"`
cd $PRG_HOME

NAME=""
INTERPRETER=
PROGRAM=
OPTIONS=""
OUTFILE=""

PIDFILE="/tmp/$NAME.pid"


pid=`cat $PIDFILE`
PIDEXIST=$([ -n $pid -a -d "/proc/$pid" ] && echo $pid || echo "")

if [[ "$PIDEXIST" != "" ]]; then
	echo "Running with pid $PIDEXIST"
	exit
fi

nohup $INTERPRETER $PROGRAM $OPTIONS &> $OUTFILE &
echo $! > $PIDFILE


