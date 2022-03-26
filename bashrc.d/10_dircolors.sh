# Set solarized-dark directory colors

osname=$(uname -s)
case "$osname" in
  Linux)
    ## BASH
    url_dir_colors=https://raw.githubusercontent.com/speedpacer/gitbash_solarized/master/.dir_colors
    fn=~/.dir_colors-solarized-dark
    [[ -f "$fn" ]] || curl -s -o "$fn" "$url_dir_colors"
    eval $(dircolors "$fn")
    ;;
  MINGW*)
    ## MINTTY (git bash for windows)
    fn=~/.minttyrc
    url_mintty=https://raw.githubusercontent.com/speedpacer/gitbash_solarized/master/.minttyrc
    marker='#SOLARIZED'
    grep -q -F "$marker" "$fn" 2>/dev/null || {
      echo "$marker" >> $fn
      curl -s "$url_mintty" >> "$fn"
    }
    marker='#CUSTOM'
    grep -q -F "$marker" "$fn" 2>/dev/null || {
      echo "$marker" >> $fn
      echo "FontHeight=11" >> "$fn"
      echo "CursorBlinks=no" >> "$fn"
      echo "Columns=90" >> "$fn"
      echo "Rows=50" >> "$fn"
    }
    ;;
esac
