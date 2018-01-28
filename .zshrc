# zsh configuration
export ZSH=$HOME/.oh-my-zsh

# install oh-my-zsh if it already isn't installed
if [ ! -s $HOME/.oh-my-zsh/oh-my-zsh.sh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

ZSH_THEME="refined"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git osx npm z zsh-autosuggestions kubectl docker)

source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8

# pip auto completion
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
export PYTHONSTARTUP=~/.pythonrc # python startup script

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh"
source "${HOME}/.iterm2_shell_integration.zsh"

# Prefer homebrew binaries to local ones
export PATH="/usr/local/sbin:$PATH"

# gnupg config
export "GPG_TTY=$(tty)"

# proxy configuration
export http_proxy=`scutil --proxy | awk '\
  /HTTPEnable/ { enabled = $3; } \
  /HTTPProxy/ { server = $3; } \
  /HTTPPort/ { port = $3; } \
  END { if (enabled == "1") { print "http://" server ":" port; } }'`
export https_proxy=`scutil --proxy | awk '\
  /HTTPEnable/ { enabled = $3; } \
  /HTTPProxy/ { server = $3; } \
  /HTTPPort/ { port = $3; } \
  END { if (enabled == "1") { print "https://" server ":" port; } }'`
export all_proxy=`scutil --proxy | awk '\
  /HTTPEnable/ { enabled = $3; } \
  /HTTPProxy/ { server = $3; } \
  /HTTPPort/ { port = $3; } \
  END { if (enabled == "1") { print server ":" port; } }'`

# postgresql@9.6 binary path
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH=$PATH:~/scripts

# golang configuration
export GOPATH=$HOME/Developer/gocode
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

# misc
alias brewtree='brew graph --installed | dot -Tpng -ograph.png'
alias g=hub

# added by travis gem
[ -f /Users/naveenkumarsangi/.travis/travis.sh ] && source /Users/naveenkumarsangi/.travis/travis.sh

