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
alias d="docker"
alias dc="docker compose"
alias dcu="docker compose up"
alias dcd="docker compose down"
alias dcb="docker compose build"
alias diff="difft"
alias tf="terraform"
alias pn="pnpm"
alias rsrc="source ~/.zshrc"
alias genran="openssl rand -base64"
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
alias gs='git status'
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

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# BUG: this is causing extremely slow startups so commenting out nvm for now
export NVM_DIR="$HOME/.nvm"
export NVM_LAZY=1
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# bun completions
[ -s "/Users/markdoyle/.bun/_bun" ] && source "/Users/markdoyle/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


# ranger
export VISUAL=/opt/homebrew/bin/hx
export EDITOR=/opt/homebrew/bin/hx

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

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
