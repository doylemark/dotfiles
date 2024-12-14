import tomllib
from pathlib import Path


def get_xdg_config_path():
    try:
        config_path = Path("./.config") / \
            "alacritty" / "custom.toml"
        return config_path
    except Exception:
        return None


def config_parse(file: Path):
    try:
        with open(file, "rb") as f:
            data = tomllib.load(f)
            return data if data else {}
    except Exception as e:
        print(e)
    return {}


path = get_xdg_config_path()
if path:
    config = config_parse(path)

colors = ["black", "red", "green", "yellow",
          "blue", "magenta", "cyan", "white"]

colors_normal_dict = {k: "" for k in colors}
colors_bright_dict = {k: "" for k in colors}


if config:
    for key, value in config["colors"]["normal"].items():
        colors_normal_dict[key] = value.replace("0x", "#")
    for key, value in config["colors"]["bright"].items():
        colors_bright_dict[key] = value.replace("0x", "#")


print(f"background = {config["colors"]["primary"]
      ["background"].replace("0x", "#")}")
print(f"foreground = {config["colors"]["primary"]
      ["foreground"].replace("0x", "#")}")
for index, value in enumerate(colors_normal_dict.values()):
    print(f"palette = {index}={value}")

for index, value in enumerate(colors_bright_dict.values()):
    print(f"palette = {index+8}={value}")
