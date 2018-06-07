# zsh configuration
export EDITOR=vim
export LANG=en_US.UTF-8
export PROJECTS=/Volumes/Code/Developer
export SCRIPTS=$HOME/scripts
export ZSH=$HOME/.oh-my-zsh

# nvm configuration
export NVM_LAZY_LOAD=true
export NVM_DIR=$HOME/.nvm

# Prefer homebrew binaries to local ones
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Add yarn binary path to $PATH
export PATH=~/.config/yarn/global/node_modules/.bin:$PATH

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

# golang configuration
export GOPATH=$PROJECTS/gocode
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

# use scripts before everything else¬
export PATH=$HOME/scripts:$PATH
