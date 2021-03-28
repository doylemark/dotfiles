fortune | cowsay -f tux

function mkcd()
{
	mkdir $1 && cd $1
}

function rn()
{
	mv $1 $2 && rm -rf $1
}

function metar() {
	curl "http://metar.vatsim.net/metar.php?id=$1"
}

function newrepo() {
    gh repo create "$1" -y --private
    git branch -M main
    git push -u origin main
}

function gitlazy() {
    git add .
    git commit -a -m "$1"
    git push
}

# -------
# Aliases
# -------
alias cls="clear"
alias 🍺="git checkout -b drunk"
alias a='code .'
alias reveal-md="reveal-md --theme night --highlight-theme hybrid --port 1337"
alias ns='npm start'
alias start='npm start'
alias nr='npm run'
alias run='npm run'
alias nis='npm i -S'
alias l="ls" # List files in current directory
alias ll="ls -al" # List all files in current directory in long list format
alias o="open ." # Open the current directory in Finder
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias c="clear"
alias dev="cd ~/dev"

# ----------------------
# Go Aliases
# ----------------------
alias air='$(go env GOPATH)/bin/air'
alias mygo="cd $(go env GOPATH)/src/github.com/doylemark"

# ----------------------
# K8s Aliases
# ----------------------
alias k="kubectl"
alias kg="kubectl get"

# ----------------------
# Git Aliases
# ----------------------
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gc='git commit'
alias gcm='git commit -m'
alias gd='git diff'
alias gi='git init'
alias gl='git log'
alias gp='git pull'
alias gpsh='git push'
alias gss='git status -s'
alias gs='echo ""; echo "*********************************************"; echo -e "   DO NOT FORGET TO PULL BEFORE COMMITTING"; echo "*********************************************"; echo ""; git status'
alias gm="git rm --cached"

function gcl() {
	git clone $1
}

eval "$(starship init zsh)"

export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:/usr/local/go/bin

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

