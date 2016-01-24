#!/bin/bash
CFGDIR=etc/mountpoint_cfgs

for i in `ls $CFGDIR`
do
  source $CFGDIR/$i
  echo $FILESYSTEM
  echo $DIR
  echo $TYPE
  echo $OPTIONS
  echo $DUMP
  echo $PASS
  if [ -f $DIR ]
  then
    echo mkdir -p $DIR
  fi
  echo "mount "$FILESYSTEM" "$DIR" -t "$TYPE "-o "$OPTIONS",dump="$DUMP",pass="$PASS
  echo "mkdir -p $DIR/partition $DIR/data/private $DIR/exports"
done
