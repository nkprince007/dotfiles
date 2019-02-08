fenv source $HOME/.profile

# misc
alias brewtree='brew graph --installed | dot -Tpng -ograph.png'
alias dc=docker-compose
alias dk=docker
alias e=emacsclient

# additional functions
function docker-start
    open /Applications/Docker.app
end

function docker-stop
    killall Docker
end

function fish_title
    true
end

# GnuPG preparation
if test -f ~/.gnupg/.gpg-agent-info
    fenv source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
end

# pyenv init
status --is-interactive; and source (pyenv init - --no-rehash|psub)

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && fenv source "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
