# Set solarized-dark directory colors

## BASH
url=https://raw.githubusercontent.com/speedpacer/gitbash_solarized/master/.dir_colors
fn=~/.dir_colors-solarized-dark
[[ -f "$fn" ]] || curl -s -o "$fn" "$url"
eval $(dircolors "$fn")

## MINTTY (git bash for windows)
url=https://raw.githubusercontent.com/speedpacer/gitbash_solarized/master/.minttyrc
fn=~/.minttyrc
[[ -f "$fn" ]] || {
  > "$fn" \
  curl -s "$url" \
  | sed '/FontHeight/c\FontHeight=11'
