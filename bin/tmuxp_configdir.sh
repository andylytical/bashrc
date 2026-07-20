#!/bin/bash

# see also: https://github.com/tmux-python/tmuxp
# check in order:
#   TMUXP_CONFIGDIR
#   XDG_CONFIG_HOME/tmuxp
#   $HOME/.tmuxp/

if [[ -z "${TMUXP_CONFIGDIR}" ]] ; then
  if [[ -n "${XDG_CONFIG_HOME}" ]] ; then
    if [[ -d "${XDG_CONFIG_HOME}"/tmuxp ]] ; then
      TMUXP_CONFIGDIR="${XDG_CONFIG_HOME}"/tmuxp
    fi
  elif [[ -d "${HOME}"/.config/tmuxp ]] ; then
    TMUXP_CONFIGDIR="${HOME}"/.config/tmuxp
  elif [[ -d "${HOME}"/.tmuxp ]] ; then
    TMUXP_CONFIGDIR="${HOME}"/.tmuxp
  fi
fi
if [[ -d "${TMUXP_CONFIGDIR}" ]] ; then
  : pass
else
  echo 'Unable to find tmuxp config dir'
  exit 1
fi
echo "${TMUXP_CONFIGDIR}"
