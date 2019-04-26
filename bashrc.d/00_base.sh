set -o vi

editr=$(which vim)
[[ -f "$editr" ]] && editr=/bin/vi
export EDITOR="$editr"
