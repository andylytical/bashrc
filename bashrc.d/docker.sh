complete -F _docker dk

#
# Convenience aliases
#
alias dps="docker ps -a"
alias da="docker attach"
alias fedora="docker run --rm -it fedora bash"
alias ubuntu="docker run --rm -it ubuntu bash"
alias p3='docker run --rm -it python:3'

# Cleanup aliases
alias dpclean='docker ps -a -q | xargs -r docker rm'
alias diclean='docker images -f "dangling=true" -q | xargs -r docker rmi'

#
# Docker local containers with various mappings for dev, X, local-user etc.
#

# short emit wrapper
_p() {
  echo -n ' '$*
}

# 1:1 mapped env's (copied
dkEnvs() {
  for e in $*; do
    _p -e ${e}="$(eval echo \$$e)"
  done
}

# Mount from local in container 1:1
dkRo(){
  for i in $*; do
    _p -v ${i}:${i}:ro
  done;
}

# Mount from local in container 1:1
dkRw(){
  for i in $*; do
    _p -v ${i}:${i}
  done;
}

# Run as a local user/group, pass args (user group) or default to caller
dkAsUser() {
  user=${1-""}
  group=${2-""}
  _p --user $(id -u $user):$(id -g $group)
  dkEnvs HOME
  dkRo /etc/passwd /etc/group /etc/shadow /etc/sudoers /etc/group
  dkRw /home
}

# Include local X
dkX(){
  dkRw /tmp/.X11-unix
  dkEnvs DISPLAY
  dkAsUser
}

dkDev(){
  dkRw ~/working
  #dkX
  dkAsUser
  _p -w $PWD
}


# Exec bash in a running container
dksh(){
    docker exec -it "${1}" /bin/bash
}
