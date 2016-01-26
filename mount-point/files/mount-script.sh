#!/bin/bash
CFGDIR=/etc/mountpoint_cfgs

for i in `ls $CFGDIR`
do
  source $CFGDIR/$i
  if [ -f $DIR ]
  then
    echo mkdir -p $DIR
  fi
  mount $FILESYSTEM" "$DIR" -t "$TYPE "-o "$OPTIONS",dump="$DUMP",pass="$PASS
  mkdir -p $DIR/partition $DIR/data/private $DIR/exports
  blkid -s UUID -o value $FILESYSTEM
done
