# zsh configuration
export EDITOR=vim
export TERM=xterm-256color
export LC_ALL=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LANG=en_US
export PROJECTS=$HOME/Developer
export SCRIPTS=$HOME/scripts

# Prefer homebrew binaries to local ones
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# gnupg config
export "GPG_TTY=$(tty)"

# golang configuration
export GOPATH=$PROJECTS

# flutter configuration
export PATH=$PATH:/$PROJECTS/src/github.com/flutter/flutter/bin

# use scripts before everything else¬
export PATH=$HOME/scripts:$PATH

# git gettext issue
export GIT_INTERNAL_GETTEXT_TEST_FALLBACKS=1
