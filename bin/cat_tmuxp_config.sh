#!/usr/bin/bash

[[ $# -lt 1 ]] && {
  echo missing tmuxp config name
  exit 1
}

tmuxp ls --json \
| jq -r ".workspaces[] | select(.name == \"$1\") | .path" \
| sed -e 's/~\///' \
| xargs -r -I{} cat $HOME/{}
