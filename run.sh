#!/bin/bash

HOMEDIR="/home/nimr"
RUNDIR="$HOMEDIR/www/dict.weitnahbei.de:2001/installations/ankidict_arde-dear"
DAEMON="$HOMEDIR/.rvm/bin/ruby193_rails32_thin"
CONFIG=" -C config/thin.yml"

(
  cd $RUNDIR
  case $1 in
    start)
      exec $DAEMON $CONFIG start
      ;;
    stop)
      exec $DAEMON $CONFIG stop 2>/dev/null
      ;;
    restart)
      $DAEMON $CONFIG stop 2>/dev/null
      sleep 1
      exec $DAEMON $CONFIG start
      ;;
    *)
      echo "Usage: run.sh start/stop/restart"
      ;;
  esac
)
