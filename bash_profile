
# START CUSTOM INCLUDE FROM GITHUB/ANDYLYTICAL/BASHRC
source ~/.bashrc
symbl='$'
if [ "`id -u`" -eq 0 ]; then
    symbl='->'
fi
export PS1="\n\[\e[32;1m\](\[\e[37;1m\]\u@\h:\[\e[37;1m\]\w\[\e[32;1m\]\[\e[32;1m\])-(\[\e[37;1m\]\D{%Y-%m-%d} \t\[\e[32;1m\])\n(\[\[\e[37;1m\]! \!\[\e[32;1m\])$symbl \[\e[0m\]"
# END CUSTOM INCLUDE FROM GITHUB/ANDYLYTICAL/BASHRC
