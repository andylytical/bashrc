#!/bin/bash

set -x

BASE=$( dirname $0 )
RC=bashrc
RCDIR=~/.bashrc.d
PROFILE=bash_profile
GREP_PATTERN='CUSTOM INCLUDE FROM GITHUB/ANDYLYTICAL/BASHRC'
SUFFIX=$(date +%s)

# Copy source files to bashrc dir
mkdir -p $RCDIR
for src in $BASE/bashrc.d/*.sh; do
  tgt=$RCDIR/$(basename $src)
  install --compare --backup --suffix=$SUFFIX "$src" "$tgt"
done

# Ensure include exists in bashrc
src="$BASE/$RC"
tgt=~/.$RC
grep -q "$GREP_PATTERN" $tgt \
|| cat $src >>$tgt

# Ensure include exists in profile
src="$BASE/$PROFILE"
tgt=~/.$PROFILE
grep -q "$GREP_PATTERN" $tgt \
|| cat $src >>$tgt
