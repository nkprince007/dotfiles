# zsh configuration
export EDITOR=vim
export LANG=en_US.UTF-8
export PROJECTS=/Volumes/Code/Developer
export SCRIPTS=$HOME/scripts
export ZSH=$HOME/.oh-my-zsh
setopt interactivecomments
setopt nobeep

# nvm configuration
export NVM_LAZY_LOAD=true
export NVM_DIR=$HOME/.nvm

# oh-my-zsh configuration
COMPLETION_WAITING_DOTS=true
DISABLE_AUTO_TITLE=true
DISABLE_UPDATE_PROMPT=true
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white'

# Antigen configuration
source $(brew --prefix)/share/antigen/antigen.zsh


antigen use oh-my-zsh
antigen bundle common-aliases
antigen bundle history
antigen bundle git
antigen bundle lukechilds/zsh-nvm
antigen bundle marzocchi/zsh-notify
antigen bundle z
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme refined 
antigen apply

# terminal-notifier configuration
zstyle ':notify:*' notifier $(which terminal-notifier)
zstyle ':notify:*' command-complete-timeout 10

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

# golang configuration
export GOPATH=$PROJECTS/gocode
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

# misc
alias brewtree='brew graph --installed | dot -Tpng -ograph.png'
alias dc=docker-compose

# use scripts before everything else
export PATH=$HOME/scripts:$PATH
