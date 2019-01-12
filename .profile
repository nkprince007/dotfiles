# zsh configuration
export EDITOR=nvim
export TERM=xterm-256color
export LC_ALL=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export PROJECTS=$HOME/Developer
export SCRIPTS=$HOME/scripts

# nvm configuration
# export NVM_LAZY_LOAD=true
export NVM_DIR=$HOME/.nvm

# Prefer homebrew binaries to local ones
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Add yarn binary path to $PATH
export PATH=~/.config/yarn/global/node_modules/.bin:$PATH

# gnupg config
export "GPG_TTY=$(tty)"

# # proxy configuration
# export http_proxy=`scutil --proxy | awk '\
#  /HTTPEnable/ { enabled = $3; } \
#  /HTTPProxy/ { server = $3; } \
#  /HTTPPort/ { port = $3; } \
#  END { if (enabled == "1") { print server ":" port; } }'`
# export https_proxy=$http_proxy
# export all_proxy=$http_proxy

# golang configuration
export GOPATH=$PROJECTS
export PATH=$PATH:/usr/local/opt/go@1.9/libexec/bin:$GOPATH/bin

# flutter configuration
export PATH=$PATH:/$PROJECTS/src/github.com/flutter/flutter/bin

# use scripts before everything else¬
export PATH=$HOME/scripts:$PATH

# use rbenv ruby by default
export PATH=$HOME/.rbenv/shims/:$PATH

# use pyenv python by default
eval "$(pyenv init -)"
export PATH=$HOME/.pyenv/bin:$PATH

# use cargo bin
export PATH=$HOME/.cargo/bin:$PATH

# use homebrew curl instead of system curl
export PATH="/usr/local/opt/curl/bin:$PATH"

# git gettext issue
export GIT_INTERNAL_GETTEXT_TEST_FALLBACKS=1
