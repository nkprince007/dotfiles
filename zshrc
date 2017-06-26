export ZSH=$HOME/.oh-my-zsh

if [ -s ~/.oh-my-zsh/oh-my-zsh.sh ] || [ -s ~/.zshrc.pre-oh-my-zsh ] ; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

ZSH_THEME="refined"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git osx npm z zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip

export EDITOR=vim           # set default editor as vim
setopt interactivecomments  # ignore lines prefixed with '#'
setopt nobeep               # stop beeping
export PYTHONSTARTUP=~/.pythonrc # python tab completion
