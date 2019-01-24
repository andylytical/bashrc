#!/bin/bash

set -x

#RC=~/.bashrc
#RCDIR=~/.bashrc.d
RC=~/.junk
RCDIR=~/.junk.d
BASE=$( dirname $0 )

# Ensure include exists in bashrc
grep -q 'User specific setup' $RC \
|| cat $BASE/bashrc >>$RC

# Copy source files to bashrc dir
mkdir -p $RCDIR
for src in $BASE/bashrc.d/*.sh; do
    tgt=$RCDIR/$(basename $src)
    [[ -f $tgt ]] || cp $src $tgt
done
