#!/bin/bash

RC=~/.bashrc
RCDIR=~/.bashrc.d
BASE=$( dirname $0 )
echo BASE=$BASE

## Ensure include exists in bashrc
#grep -q 'User specific setup' $RC \
#|| cat bashrc >>$RC
#
## Copy source files to bashrc dir
#mkdir -p $RCDIR
#for f in ./bashrc.d/*.sh; do cp "$f" $RCDIR/; done
