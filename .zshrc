# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# -------
# General Aliases
# -------
alias pip="pip3"
alias cls="clear && printf '\e[3J'"
alias l="ls"
alias ll="ls -al"
alias o="open ." 
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias c="clear"
alias p="pbpaste"
alias ls="exa"
alias t="exa -T"
alias cat="bat"
alias ns="npm start"
alias nr="npm run"
alias dc="docker compose"
alias dcu="docker compose up"
alias dcd="docker compose down"
alias dcb="docker compose build"
alias diff="difft"
alias tf="terraform"
alias pn="pnpm"

# -----------------
# Shortcuts
# -----------------
alias pgev="psql -h localhost -p 5432 -U api -d evervault"

function mkcd() {
  mkdir $1
  cd $1
}

# ----------------------
# Git Aliases
# ----------------------
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gc='git commit'
alias gch='git checkout'
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
alias gv="git remote get-url origin | xargs open $1" 
alias gpo='git push origin "$(git symbolic-ref --short HEAD)"'
alias grv="git reset --hard"
alias gbc="git symbolic-ref --short HEAD | pbcopy "

function gcl() {
	git clone $1
}

function gitlazy() {
  git add .
  git commit -a -m "$1"
  git push
}

function set_win_title() {
  echo -ne "\033]0; $pwd \007"
}

eval "$(starship init zsh)"
precmd_functions+=(set_win_title)

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
eval "$(rbenv init - zsh)"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
