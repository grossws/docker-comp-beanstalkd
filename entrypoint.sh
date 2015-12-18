#!/bin/bash

if [ "$1" = "beanstalkd" ] ; then
  shift
  OPTIND=1

  chown -R beanstalkd:beanstalkd /data

  exec gosu beanstalkd:beanstalkd /usr/bin/beanstalkd -l 0.0.0.0 -p 11300 -b /data -f 1000
fi

exec "$@"
