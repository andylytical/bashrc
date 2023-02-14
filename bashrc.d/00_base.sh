set -o vi

export EDITOR=/usr/bin/vim
export HISTFILE=''

alias ll='ls -l'
alias la='ls -la'

pathmunge () {
	if ! echo $PATH | /bin/egrep -q "(^|:)$1($|:)" ; then
		if [ "$2" = "after" ] ; then
			PATH=$PATH:$1
		else
			PATH=$1:$PATH
		fi
	fi
}

pathmunge ~/bin
pathmunge ~/.local/bin
