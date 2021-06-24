# Environment variables
export EDITOR=vim
export TERM=xterm-256color
export LC_ALL=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LANG=en_US
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/Library/Python/$(stat -f %Y /opt/local/bin/python | sed 's/[^0-9\.]*//g')/bin"
export PATH="$PATH:/opt/local/lib/postgresql10/bin"
export PATH="$PATH:/opt/flutter/bin"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools"
export JAVA_HOME="$(/usr/libexec/java_home -v 8)"
export XDG_CONFIG_HOME="$HOME/.config"
export GO111MODULE=auto
export SCRIPTS=$HOME/scripts

# use scripts before everything else
export PATH=$SCRIPTS:$PATH

# git gettext issue
export GIT_INTERNAL_GETTEXT_TEST_FALLBACKS=1

# added by Nix installer
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
    . $HOME/.nix-profile/etc/profile.d/nix.sh
fi
