# zsh configuration
export ZSH=$HOME/.oh-my-zsh
export PROJECTS=/Volumes/Code/Developer

# nvm configuration
export NVM_LAZY_LOAD=true
export NVM_DIR=$HOME/.nvm

# install oh-my-zsh if it already isn't installed
if [ ! -s $HOME/.oh-my-zsh/oh-my-zsh.sh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# use nvm from Homebrew
if [ ! -s $NVM_DIR/nvm.sh ]; then
    ln -s $(brew --prefix nvm)/nvm.sh $NVM_DIR/nvm.sh
fi

ZSH_THEME="refined"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git osx npm z zsh-autosuggestions docker zsh-nvm)

source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
export EDITOR=vim           # set default editor as vim
setopt interactivecomments  # ignore lines prefixed with '#'
setopt nobeep               # stop beeping

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh"
source "${HOME}/.iterm2_shell_integration.zsh"

# Prefer homebrew binaries to local ones
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# gnupg config
export "GPG_TTY=$(tty)"

# proxy configuration
export http_proxy=`scutil --proxy | awk '\
  /HTTPEnable/ { enabled = $3; } \
  /HTTPProxy/ { server = $3; } \
  /HTTPPort/ { port = $3; } \
  END { if (enabled == "1") { print server ":" port; } }'`
export https_proxy=$http_proxy
export all_proxy=$http_proxy

# postgresql@9.6 binary path
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

# golang configuration
export GOPATH=$PROJECTS/gocode
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

# misc
alias brewtree='brew graph --installed | dot -Tpng -ograph.png'
alias g=lab

# ns2-allinone
export PATH="/Volumes/Code/ns-allinone-2.35/bin:/Volumes/Code/ns-allinone-2.35/tcl8.5.10/unix:/Volumes/Code/ns-allinone-2.35/tk8.5.10/unix:$PATH"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/Volumes/Code/ns-allinone-2.35/otcl-1.14":"/Volumes/Code/ns-allinone-2.35/lib"
export TCL_LIBRARY=/Volumes/Code/ns-allinone-2.35/tcl8.5.10/library:/Volumes/Code/ns-allinone-2.35/tcl8.5.10/library

# use scripts before everything else
export PATH=$HOME/scripts:$PATH
