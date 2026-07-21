# fzf picker for tmuxp Workspaces
ft() {
  local workspace
  workspace=$( tmuxp ls --json \
  | jq -r '.workspaces[].name' \
  | fzf \
    --header "Pick tmuxp workspace" \
    --preview "cat_tmuxp_config.sh {}")

  if [[ -n "${workspace}" ]]; then
    tmuxp load "${workspace}"
  else
    echo "No workspace given"
  fi
}


# fzf picker to make a tmuxp workspace for a git repo working dir
fg() {
  local dir_path
  dir_path=$( \
  ls_git_dirs.sh \
  | fzf \
    --header "Which git repo?" \
    --preview "ls {}" )
  if [[ -d "${dir_path}" ]]; then
    dir2tmux.sh "${dir_path}"
  else
    echo "Nevermind"
  fi
}


# fzf picker to reattach to an existing tmux session
fr() {
  local tmux_session_name
  tmux_session_name=$( \
    tmux ls \
    | awk -F: '{print $1}' \
    | fzf \
      --header "Which session?" \
      --preview "tmux list-windows -t {}" )
  if [[ -n "${tmux_session_name}" ]]; then
    tmux a -dt "${tmux_session_name}"
  else
    echo "Nevermind"
  fi
}
