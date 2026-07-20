#!/usr/bin/bash

[[ "$#" -lt 1 ]] && {
  echo missing dirname
  exit 1
}
TMUXP_START_DIR="${1}"
[[ -d "${TMUXP_START_DIR}" ]] || {
  echo "not a dir '${TMUXP_START_DIR}'"
  exit 1
}

TMUXP_SESSION_NAME=$( basename "${TMUXP_START_DIR}" )
TMUXP_WINDOW_NAME="${TMUXP_SESSION_NAME}"

export TMUXP_START_DIR
export TMUXP_SESSION_NAME
export TMUXP_WINDOW_NAME
tmuxp load --no-progress git-repo
