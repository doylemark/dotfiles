# General Aliases
alias cls="clear && printf '\e[3J'"
alias l="ls"
alias ll="ls -al"
alias c="clear"
alias p="pbpaste"
alias rsrc="source ~/.zshrc"
alias :q="exit"

autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line
bindkey '^Xe' edit-command-line

# Navigation Aliases
alias ~="cd ~"
alias o="open ." 
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Docker Aliases
alias d="docker"
alias dc="docker compose"
alias dcu="docker compose up"
alias dcd="docker compose down"
alias dcb="docker compose build"

# Shortcuts
alias tf="terraform"
alias ns="npm start"
alias nr="npm run"
alias pn="pnpm"

# Redirecting Aliases
alias cd="z"
alias cat="bat"
alias diff="difft"
alias ls="eza"
alias t="eza -T"
alias pip="pip3"
alias python="python3"
alias vim="nvim"

export evs=~/ev/scripts

function mkcd() {
  mkdir $1
  cd $1
}

# Git Aliases
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
alias cpb="git symbolic-ref --short HEAD | pbcopy "
alias branch="git branch | grep -v \"^\*\" | fzf --height=20% --reverse --info=inline | xargs git checkout"
alias cppb="git rev-parse --symbolic-full-name --abbrev-ref=loose @{-1}"

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

eval "$(starship init zsh)"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export NVM_DIR="$HOME/.nvm"
export NVM_LAZY=1
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# bun completions
# [ -s "/Users/markdoyle/.bun/_bun" ] && source "/Users/markdoyle/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export BAT_THEME="GitHub"

# ranger
export VISUAL=nvim
export EDITOR=nvim

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# atuin
eval "$(atuin init zsh --disable-up-arrow)"
# pnpm
export PNPM_HOME="/Users/markdoyle/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"


autoload -U compinit; compinit
source ~/.config/fzf-tab/fzf-tab.plugin.zsh
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
# complete -o nospace -C /opt/homebrew/bin/terraform terraform

# bat
export BAT_THEME="Monokai Extended"
# zoxide
eval "$(zoxide init zsh)"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
