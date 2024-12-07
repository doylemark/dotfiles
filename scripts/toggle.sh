ALACRITTY=~/.config/alacritty/alacritty.toml
NVIM=~/.config/nvim/init.lua

if grep -q "github_light" "$ALACRITTY"; then
  sed -i '' 's/github_light/custom/' "$ALACRITTY"
  tmux set-option -g status-style bg=colour237,fg=colour223
else
  sed -i '' 's/custom/github_light/' "$ALACRITTY"
  tmux set-option -g status-style bg=colour255,fg=colour215
fi

if grep -q "monokai" "$NVIM"; then
  sed -i '' 's/monokai/github_light/' "$NVIM"
else
  sed -i '' 's/github_light/monokai/' "$NVIM"
fi

