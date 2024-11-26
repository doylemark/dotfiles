ALACRITTY=~/.config/alacritty/alacritty.toml
NVIM=~/.config/nvim/init.lua

if grep -q "github_light" "$ALACRITTY"; then
  sed -i '' 's/github_light/custom/' "$ALACRITTY"
else
  sed -i '' 's/custom/github_light/' "$ALACRITTY"
fi

if grep -q "monokai" "$NVIM"; then
  sed -i '' 's/monokai/github_light/' "$NVIM"
else
  sed -i '' 's/github_light/monokai/' "$NVIM"
fi
