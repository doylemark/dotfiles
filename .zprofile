
eval "$(/opt/homebrew/bin/brew shellenv)"


# Added by Toolbox App
export PATH="$PATH:/Users/mark/Library/Application Support/JetBrains/Toolbox/scripts"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Homebrew paths
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

# Java paths
# export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
# export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
#
# Language specific paths
export PATH="/opt/homebrew/Cellar/ruby/3.3.6/bin:$PATH"
export PATH="/opt/homebrew/Cellar/git/2.47.0/bin:$PATH"

# Package manager paths
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Toolbox App
export PATH="$PATH:/Users/mark/Library/Application Support/JetBrains/Toolbox/scripts"

# PNPM
export PNPM_HOME="/Users/markdoyle/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac 
