#-------------------------------------------------------------------------------
# Core ZSH Configuration
#-------------------------------------------------------------------------------
autoload -U compinit; compinit
autoload edit-command-line; zle -N edit-command-line

# Vi mode bindings
bindkey -M vicmd 'v' edit-command-line
bindkey '^Xe' edit-command-line

#-------------------------------------------------------------------------------
# Environment Variables
#-------------------------------------------------------------------------------
export VISUAL=nvim
export EDITOR=nvim
export evs=~/ev/scripts

#-------------------------------------------------------------------------------
# General Aliases
#-------------------------------------------------------------------------------

alias cls="clear && printf '\e[3J'"
alias l="ls"
alias ll="ls -al"
alias c="clear"
alias rsrc="source ~/.zshrc"
alias :q="exit"
alias theme="sh ~/dotfiles/scripts/toggle.sh"

# Modern replacements
alias diff="difft"
alias ls="eza"
alias t="eza -T"
alias vim="nvim"
alias v="nvim"
alias cd="z"

# Common shortcuts
alias p="pbpaste"
alias o="open ."
alias tf="terraform"
alias ns="npm start"
alias nr="npm run"
alias pn="pnpm"
alias br="bin/rails"

#-------------------------------------------------------------------------------
# Navigation Aliases
#-------------------------------------------------------------------------------
alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

#-------------------------------------------------------------------------------
# Docker Aliases
#-------------------------------------------------------------------------------
alias d="docker"
alias dc="docker compose"
alias dcu="docker compose up"
alias dcd="docker compose down"
alias dcb="docker compose build"

#-------------------------------------------------------------------------------
# Git Aliases & Functions
#-------------------------------------------------------------------------------
alias g='git'
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gc='git commit'
alias gcl='git clone'
alias gch='git checkout'
alias gcm='git commit -m'
alias gd='git diff'
alias gi='git init'
alias gl='git log'
alias gp='git pull'
alias gpsh='git push'
alias gpshu='git push --set-upstream origin master'
alias gss='git status -s'
alias gs='git status'
alias gm="git rm --cached"
alias gv="git remote get-url origin | xargs open $1" 
alias gpo='git push origin "$(git symbolic-ref --short HEAD)"'
alias grv="git reset --hard"
alias gb="git branch"
alias gsw="git switch"
alias gsh="git show"
alias gcp="git cherry-pick"
alias cpb="git symbolic-ref --short HEAD | pbcopy "
alias branch="git branch | grep -v \"^\*\" | fzf --height=20% --reverse --info=inline | xargs git checkout"
alias cppb="git rev-parse --symbolic-full-name --abbrev-ref=loose @{-1}"

# Git Functions
function gitlazy() {
  git add .
  git commit -a -m "$1"
  git push
}

function gitback() {
  git stash
  git checkout main
  git pull
  git checkout -b $1
  git stash pop
}

#-------------------------------------------------------------------------------
# Utility Functions
#-------------------------------------------------------------------------------
function mkcd() {
  mkdir $1
  cd $1
}

#-------------------------------------------------------------------------------
# Tool Initializations
#-------------------------------------------------------------------------------
# Starship prompt
eval "$(starship init zsh)"

# PyEnv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.config/fzf-tab/fzf-tab.plugin.zsh
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# Atuin shell history
eval "$(atuin init zsh --disable-up-arrow)"

# ZSH plugins
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Zoxide
eval "$(zoxide init zsh)"
