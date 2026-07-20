# fzf picker for tmuxp Workspaces
ft() {
  local workspace tmuxp_dir ext
  tmuxp_dir="${HOME}"/.config/tmuxp #full path to your tmuxp config dir
  ext=.yaml #extension you use for your yaml files
  workspace=$( tmuxp ls \
  | fzf \
    --header "Pick tmuxp workspace" \
    --preview "cat ${tmuxp_dir}/{}.yaml")

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
