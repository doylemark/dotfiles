#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####

# Print fortune to terminal on boot
fortune | cowsay -f tux

# -------
# General Helper Functions
# -------
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

# -------
# General Aliases
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
alias l="ls"
alias ll="ls -al"
alias o="open ." # Open the current directory in Finder
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias c="clear"
alias dev="cd ~/dev"

# ----------------------
# K8s Aliases
# ----------------------
alias k="kubectl"
alias kg="kubectl get"
alias tf="terraform"
alias tfa="terraform apply"
alias tfd="terraform destroy"

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
alias gpshu='git push --set-upstream origin master'
alias gss='git status -s'
alias gs='echo ""; echo "*********************************************"; echo -e "   DO NOT FORGET TO PULL BEFORE COMMITTING"; echo "*********************************************"; echo ""; git status'
alias gm="git rm --cached"
alias gv="gh repo view -w"

function gcl() {
	git clone $1
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

# Init starship (https://starship.rs/)
eval "$(starship init zsh)"

# Path vars :(
export PATH="/usr/local/sbin:$PATH"
export PATH=$HOME/.dotnet/tools:$PATH
export PATH=$PATH:/usr/local/go/bin
source ~/.nvm/nvm.sh

export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/Applications/Racket/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

#### FIG ENV VARIABLES ####
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####


export GPG_TTY=$(tty)
