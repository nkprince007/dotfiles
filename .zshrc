setopt interactivecomments
setopt nobeep

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
antigen bundle greymd/docker-zsh-completion
antigen bundle kubectl
antigen theme refined
antigen apply

# terminal-notifier configuration
zstyle ':notify:*' command-complete-timeout 15
zstyle ':notify:*' error-icon "$HOME/scripts/assets/angry.gif"
zstyle ':notify:*' error-title "wow such #fail"
zstyle ':notify:*' success-icon "$HOME/scripts/assets/badass.jpg"
zstyle ':notify:*' success-title "very #success. wow"
zstyle ':notify:*' error-sound "Purr"
zstyle ':notify:*' success-sound "Submarine"

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh"
source "${HOME}/.iterm2_shell_integration.zsh"

# powerlevel9k customizations
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs newline)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
DISABLE_UPDATE_PROMPT=true

# misc
alias brewtree='brew graph --installed | dot -Tpng -ograph.png'
alias dc=docker-compose
alias vim=nvim
alias dk=docker
alias code=code-insiders
alias cat=bat

# additional functions
ts() {
    local tspty=tspty.$(/usr/bin/uuidgen)
    zmodload zsh/zpty
    zpty $tspty $@
    setopt localtraps
    TRAPINT() { zpty -d $tspty }
    while zpty -r $tspty line; do
        print -Pn '%B%D{%m/%d %H:%M:%S}%b '
        print -n -- $line
    done
}

docker-start() {
    open /Applications/Docker.app
}

docker-stop() {
    killall Docker
}

function e() {
    emacsclient -a "" $@
}

function et() {
    e -nw $@
}

eval "$(rbenv init -)"
eval "$(pyenv init -)"

# GnuPG preparation
if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
fi

kubectl () {
    command kubectl $*
    if [[ -z $KUBECTL_COMPLETE ]]
    then
        source <(command kubectl completion zsh)
        KUBECTL_COMPLETE=1
    fi
}

# added by travis gem
[ -f /Users/nkprince007/.travis/travis.sh ] && source /Users/nkprince007/.travis/travis.sh
