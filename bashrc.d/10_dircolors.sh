# Set solarized-dark directory colors
fn=~/.dir_colors-solarized-dark
[[ -f "$fn" ]] \
|| curl -s -o "$fn" https://raw.githubusercontent.com/speedpacer/gitbash_solarized/master/.dir_colors
eval $(dircolors "$fn")
