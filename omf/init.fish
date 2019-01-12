fenv source $HOME/.profile

# misc
alias brewtree='brew graph --installed | dot -Tpng -ograph.png'
alias dc=docker-compose
alias dk=docker

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
