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
