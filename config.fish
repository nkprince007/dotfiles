export PYENV_ROOT=$HOME/.pyenv
export DISPLAY=(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
export LIBGL_ALWAYS_INDIRECT=1

set -gx PATH ~/scripts $PATH

alias dc=docker-compose
alias please=sudo
