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
antigen theme refined
antigen apply

# terminal-notifier configuration
zstyle ':notify:*' command-complete-timeout 15
zstyle ':notify:*' success-sound "Submarine"
zstyle ':notify:*' error-sound "Glass"

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh"
source "${HOME}/.iterm2_shell_integration.zsh"

# misc
alias brewtree='brew graph --installed | dot -Tpng -ograph.png'
alias dc=docker-compose
alias vim=nvim

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
