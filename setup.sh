#!/bin/bash

set -x

BASE=$( dirname $0 )
RC=bashrc
RCDIR=~/.bashrc.d
LOCAL_BIN=${HOME}/.local/bin
PROFILE=bash_profile
GREP_PATTERN='CUSTOM INCLUDE FROM GITHUB/ANDYLYTICAL/BASHRC'
SUFFIX=$(date +%s)

# Copy source files to bashrc dir
mkdir -p $RCDIR
for src in $BASE/bashrc.d/*.sh; do
  tgt=$RCDIR/$(basename $src)
  install --compare --backup --suffix=$SUFFIX "$src" "$tgt"
done

# Copy executable files to local bin
mkdir -p "${LOCAL_BIN}"
for src in $BASE/bin/*.sh; do
  tgt="${LOCAL_BIN}"/$(basename "$src")
  install --compare --backup --suffix=$SUFFIX "$src" "$tgt"
done

# Try to install tmuxp configs
# TODO - check if tmuxp and jq are installed, continue only if both exist
# TMUXP_CONFIGDIR="${HOME}"/$(
#   tmuxp ls --json \
#   | jq -r '.global_workspace_dirs[] | if .exists == true and .active == true then .path else empty end' \
#   | head -1 \
#   | sed -e 's/~\///'
# )
TMUXP_CONFIGDIR="${HOME}"/.config/tmuxp
[[ -n "${TMUXP_CONFIGDIR}" ]] \
&& [[ -d "${TMUXP_CONFIGDIR}" ]] \
&& for src in "${BASE}"/tmuxp/*; do
    tgt="${TMUXP_CONFIGDIR}"/$( basename "${src}")
    install --mode 0600 --compare --backup --suffix=$SUFFIX "$src" "$tgt"
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
