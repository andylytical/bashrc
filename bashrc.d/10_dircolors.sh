# Set solarized-dark directory colors
fn=~/.dir_colors
[[ -f "$fn" ]] \
|| curl -o "$fn" https://raw.githubusercontent.com/speedpacer/gitbash_solarized/master/.dir_colors
eval $(dircolors "$fn")
